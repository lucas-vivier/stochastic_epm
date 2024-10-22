#' Energy Planning Stochastic Model
#' This script defines a GAMS model for the power system with stochastic renewable generation.

import os, sys, time
from multiprocessing import Pool, cpu_count
from gamspy import Container, Set, Parameter, Variable, Equation, Model, Sense, Sum, Options, Ord
from pandas import read_csv, concat, Series, DataFrame, concat, Index
import pandas as pd
import warnings
        
import matplotlib.pyplot as plt

from figures import plot_generation_mix


def run_model(name_model='ChinaStochasticModel', deterministic=False, power_plants=None, 
              path_output=None, generation_cost=None, load_profile=None, production_profile_solar=None, production_profile_wind=None, 
              storage_cost=None, probability=None, duration='day', social_cost_emission=0, fcas_constraint=True, emission_constraint=None,
              cost_unmet=1, cost_surplus=0, rampup_coal=1.5, rampdown_coal=0.5, min_gen_coal_coef=0.4):
    """
    Main function to run the energy planning model with stochastic renewable generation.
    
    Parameters:
    - name_model: str, name of the model
    - deterministic: Boolean, if True the model is deterministic, if False it is stochastic
    - power_plants: list of str, list of power plants to include in the model
    - write_output: Boolean, if True the results are written to the output folder
    - generation_cost: str, name of the file with generation cost data
    - load_profile: str, name of the file with load profile data
    - production_profile: str, name of the file with production profile data
    - storage_cost: str, name of the file with storage cost data
    - probability: str, name of the file with probability data
    - duration: str, duration of the model (e.g. 'year')
    
    Returns:
    - summary: pandas DataFrame with the summary of the model results
    """
    warnings.filterwarnings("ignore", message="Could not infer format, so each element will be parsed individually")

    print('Running model: {}'.format(name_model))
    # Input files structure
    folder_input = 'input'

    if path_output is not None: 
        path_output = os.path.join(path_output, name_model)
        if not os.path.exists(path_output):
            os.makedirs(path_output)

    # Model constraints
    coal_ramp, min_gen_coal, total_capacity_constraint = True, True, True
    
    # Extension factor
    extension_factor = 365
    if duration == 'year':
        extension_factor = 1

    # Loading data
    load_profile_df = read_csv(os.path.join(folder_input, load_profile), index_col=None)
    gen_data_df = read_csv(os.path.join(folder_input, generation_cost), header=[1], index_col=0)
    storage_cost_df = read_csv(os.path.join(folder_input, storage_cost), index_col=0, header=None).iloc[:, 1]
    
    production_profile_solar_df = read_csv(os.path.join(folder_input, production_profile_solar), index_col=0)
    production_profile_wind_df = read_csv(os.path.join(folder_input, production_profile_wind), index_col=0)

    if duration == 'year':
        # Ensure that the production profile is in the correct format
        
        def parse_datetime_data(profile_df):
            # 
            profile_df.index = pd.to_datetime(profile_df.index)
            profile_df.index = profile_df.index.floor('H')
            
            # Remove 29/2
            profile_df = profile_df[~((profile_df.index.month == 2) & (profile_df.index.day == 29))]
            
            # Remove the last 5 hours of the year
            profile_df = profile_df.drop(profile_df.loc[profile_df.tail(5).index].index)
            
            def complete_first_day(df):
                # Missing hours for the first day (January 1st 00:00 - 05:00)
                missing_hours = pd.date_range('2024-01-01 00:00:00', '2024-01-01 04:00:00', freq='H')
                
                # Extract the corresponding data from the second day (January 2nd 00:00 - 05:00)
                corresponding_hours = pd.date_range('2024-01-02 00:00:00', '2024-01-02 04:00:00', freq='H')
                corresponding_data = df.loc[corresponding_hours]
                
                # Set the index of the corresponding data to the missing hours
                corresponding_data.index = missing_hours
                
                # Append the missing hours and data to the original DataFrame
                df_complete = pd.concat([corresponding_data, df]).sort_index()
                
                return df_complete
            
            profile_df = complete_first_day(profile_df)
            return profile_df

        production_profile_solar_df = parse_datetime_data(production_profile_solar_df)
        production_profile_solar_df = production_profile_solar_df.reset_index(drop=True)
        production_profile_solar_df.index = production_profile_solar_df.index + 1
        
        production_profile_wind_df = parse_datetime_data(production_profile_wind_df)
        production_profile_wind_df = production_profile_wind_df.reset_index(drop=True)
        production_profile_wind_df.index = production_profile_wind_df.index + 1
        
        # Select few years to reduce complexity
        # Get columns for P10, P50, P90
        temp = production_profile_wind_df.mean()
        p10, p50, p90 = temp.quantile(0.9), temp.median(), temp.quantile(0.1)
        p10, p50, p90 = (temp - p10).abs().idxmin(), (temp - p50).abs().idxmin(), (temp - p90).abs().idxmin()
        
        years = [p10, p50, p90]
        
        production_profile_solar_df = production_profile_solar_df.loc[:, years]
        production_profile_wind_df = production_profile_wind_df.loc[:, years]
        
        def parse_load_data(profile_df):
            profile_df['time'] = profile_df['Year'].astype(str) + ' ' + profile_df['Date']
            profile_df['time'] = pd.to_datetime(profile_df['time'], format='%Y %d-%b %I%p')
            
            profile_df = profile_df.set_index('time').loc[:, 'Load']
            profile_df = profile_df / profile_df.max()
            profile_df.sort_index(inplace=True)
            
            return profile_df
        
        load_profile_df = parse_load_data(load_profile_df)
        load_profile_df = load_profile_df.reset_index(drop=True)
        load_profile_df.index = load_profile_df.index + 1
    elif duration == 'day':
        load_profile_df = load_profile_df.loc[:, 'Load']
        load_profile_df.index = load_profile_df.index + 1
       
    if probability is not None:
        probability_df = read_csv(os.path.join(folder_input, probability), index_col=0).squeeze().rename(None)
    else:
        probability_df = Series(1 / len(production_profile_solar_df.columns), index=production_profile_solar_df.columns)

    # Calculate annualized capital expenditure
    gen_data_df['AnnCapex'] = gen_data_df['Capex'] * (gen_data_df['WACC'] / (1 - (1 + gen_data_df['WACC']) ** - gen_data_df['Life']))
    capex_storage, fom_storage = storage_cost_df['Capex'] * (storage_cost_df['WACC'] / (1 - (1 + storage_cost_df['WACC']) ** - storage_cost_df['Life'])), storage_cost_df['FOM']
    efficiency_storage = storage_cost_df['Efficiency']
    
    temp_solar = production_profile_solar_df.stack().rename_axis(['t', 's']).squeeze()
    temp_wind = production_profile_wind_df.stack().rename_axis(['t', 's']).squeeze()
    production_profile_df = concat([temp_solar, temp_wind], axis=0, keys=['Solar', 'Wind'], names=['RE', 't', 's'])

    if deterministic is True:
        if 'Avg' in probability_df.index:
            # Select the average probability scenario
            production_profile_df = production_profile_df.loc[production_profile_df.index.get_level_values('s') == 'Avg']
        else:
            # Calculate the average production profile
            temp = production_profile_df.unstack('s')
            temp = (temp * probability_df).sum(axis=1)
            temp = concat([temp], keys=['Avg'], names=['s'], axis=0)
            temp = temp.reorder_levels(production_profile_df.index.names)
            production_profile_df = temp
            
        probability_df = Series(1, index=Index(['Avg'], name='s'))


    if power_plants is not None:
        gen_data_df = gen_data_df.loc[gen_data_df.index.isin(power_plants)]
        production_profile_df = production_profile_df.loc[production_profile_df.index.get_level_values('RE').isin(power_plants)]
        
    
    # Initialize the model container
    m = Container()

    # -------------------------
    # Define sets
    g = Set(container=m, name='g', records=list(gen_data_df.index.unique()), description='Generation technologies')
    RE = Set(container=m, name='RE', domain=g, records=[i for i in list(gen_data_df.index.unique()) if i in ['Solar', 'Wind']], description='Renewable generation technologies')
    if duration == 'day':
        t = Set(container=m, name='t', records=[str(i) for i in range(1, 25)], description='24 time steps')
    elif duration == 'year':
        t = Set(container=m, name='t', records=[str(i) for i in range(1, 8761)], description='8760 time steps')
    s = Set(container=m, name='s', records=list(probability_df.index.unique()), description='Renewable generation scenarios')

    # -------------------------
    # Define parameters
    list_parameters = ['FOM', 'Opex', 'AnnCapex', 'Emission']
    gen_data = {i: Parameter(container=m, name=i, domain=g, records=gen_data_df[i].reset_index()) for i in gen_data_df.columns if i in list_parameters}
    
    production_profile = Parameter(container=m, name='ProductionProfile', domain=[RE, t, s], records=production_profile_df)
    load_profile = Parameter(container=m, name='Load', domain=t, records=load_profile_df.reset_index())

    probability_scenario = Parameter(container=m, name='Prob', domain=[s], records=probability_df.reset_index())

    # -------------------------
    # Define variables
    Cap = Variable(container=m, name='Cap', domain=[g], type="Positive")
    Gen = Variable(container=m, name='Gen', domain=[g, s, t], type="Positive")
    StorCap = Variable(container=m, name='StorCap', type="Positive")
    Storage = Variable(container=m, name='Storage', domain=[s, t], type="Positive")
    if 'Coal' not in list(gen_data_df.index.unique()):
        Storage.fx[s, '1'] = load_profile_df.iloc[:10].sum()
    else:
        Storage.fx[s, '1'] = 0
    StorInj = Variable(container=m, name='StorInj', domain=[s, t], type="Positive")
    StorGen = Variable(container=m, name='StorGen', domain=[s, t], type="Positive")
    Unmet = Variable(container=m, name='Unmet', domain=[s, t], type="Positive")
    Surplus = Variable(container=m, name='Surplus', domain=[s, t], type="Positive")
        
    if fcas_constraint is True:
        RaiseFCAS = Variable(container=m, name='RaiseFCAS', domain=[g, s, t], type="Positive")
        LowerFCAS = Variable(container=m, name='LowerFCAS', domain=[g, s, t], type="Positive")
        RaiseFCAS_Stor = Variable(container=m, name='RaiseFCAS_Stor', domain=[s, t], type="Positive")
        LowerFCAS_Stor = Variable(container=m, name='LowerFCAS_Stor', domain=[s, t], type="Positive")

    # -------------------------
    # Define constraints

    # Define the Demand equation
    Demand = Equation(container=m, name="Demand", domain=[s, t])
    Demand[s, t] = Sum(g, Gen[g, s, t]) + StorGen[s, t] * efficiency_storage + Unmet[s, t] - Surplus[s, t] == load_profile[t] + StorInj[s, t]
    
    # Define the Storage Balance equation
    StorBal = Equation(container=m, name="StorBal", domain=[s, t])
    StorBal[s, t].where[Ord(t) > 1] = Storage[s, t] == Storage[s, t.lag(1)] + StorInj[s, t] - StorGen[s, t]

    # Storage Limit equation
    StorLim = Equation(container=m, name="StorLim", domain=[s, t])
    StorLim[s, t].where[Ord(t) > 1] = Storage[s, t] <= StorCap

    # Storage Generation Capacity equation
    StorGenCap = Equation(container=m, name="StorGenCap", domain=[s, t])
    StorGenCap[s, t] = StorGen[s, t] <= Storage[s, t]

    # Coal Ramp Equations
    if coal_ramp is True and "Coal" in list(gen_data_df.index.unique()):
        CoalRampUp = Equation(container=m, name="CoalRampUp", domain=[s, t])
        CoalRampUp[s, t].where[Ord(t) > 1] = Gen["Coal", s, t] <= Gen["Coal", s, t.lag(1)] * rampup_coal

        CoalRampDown = Equation(container=m, name="CoalRampDown", domain=[s, t])
        CoalRampDown[s, t].where[Ord(t) > 1] = Gen["Coal", s, t] >= Gen["Coal", s, t.lag(1)] * rampdown_coal

    # Minimum generation for Coal
    if min_gen_coal is True and "Coal" in list(gen_data_df.index.unique()):
        CoalMinGen = Equation(container=m, name="CoalMinGen", domain=[s, t])
        CoalMinGen[s, t] = Gen["Coal", s, t] >= Cap["Coal"] * min_gen_coal_coef


    # Renewable Energy profile constraint
    ProfileCon = Equation(container=m, name="ProfileCon", domain=[g, s, t])
    ProfileCon[RE, s, t] = Gen[RE, s, t] <= Cap[RE] * production_profile[RE, t, s]

    # Capacity constraint per generation type
    CapCon = Equation(container=m, name="CapCon", domain=[g, s, t])
    CapCon[g, s, t] = Gen[g, s, t] <= Cap[g]

    # Total Capacity Constraint over all time steps - not included in the current version (seems redundant)
    if total_capacity_constraint is True:
        CapCon1 = Equation(container=m, name="CapCon1", domain=[g, s])
        CapCon1[g, s] = Sum(t, Gen[g, s, t]) <= Cap[g] * len(t.records) * 0.9
        
    if fcas_constraint is True:
        limit_fcas_capacity = 0.1
        limit_fcas_storage = 0.5
        coeff_re_fcas = 0.15
        
        # Constraint 1: Limit RaiseFCAS to 10% of the generation capacity
        RaiseFCAS_con = Equation(container=m, name="RaiseFCAS_con", domain=[g, s, t])
        RaiseFCAS_con[g, s, t] = RaiseFCAS[g, s, t] <= Cap[g] * limit_fcas_capacity

        # Constraint 2: Limit LowerFCAS to 10% of the generation capacity
        LowerFCAS_con = Equation(container=m, name="LowerFCAS_con", domain=[g, s, t])
        LowerFCAS_con[g, s, t] = LowerFCAS[g, s, t] <= Cap[g] * limit_fcas_capacity

        # Constraint 3: Storage can provide up to 50% of its capacity as RaiseFCAS
        RaiseFCAS_Stor_con = Equation(container=m, name="RaiseFCAS_Stor_con", domain=[s, t])
        RaiseFCAS_Stor_con[s, t] = RaiseFCAS_Stor[s, t] <= StorCap * limit_fcas_storage

        # Constraint 4: Storage can provide up to 50% of its capacity as LowerFCAS
        LowerFCAS_Stor_con = Equation(container=m, name="LowerFCAS_Stor_con", domain=[s, t])
        LowerFCAS_Stor_con[s, t] = LowerFCAS_Stor[s, t] <= StorCap * limit_fcas_storage
        
        # Constraint 6: Maintain a minimum operational level for coal (40% of capacity)
        if "Coal" in list(gen_data_df.index.unique()):
            Gen_LowerFCAS_con = Equation(container=m, name="Gen_LowerFCAS_con", domain=[s, t])
            Gen_LowerFCAS_con[s, t] = Gen["Coal", s, t] - LowerFCAS["Coal", s, t] >= Cap["Coal"] * min_gen_coal_coef

        # Constraint 5: Ensure total generation including RaiseFCAS does not exceed capacity
        Gen_RaiseFCAS_con = Equation(container=m, name="Gen_RaiseFCAS_con", domain=[g, s, t])
        Gen_RaiseFCAS_con[g, s, t] = Gen[g, s, t] + RaiseFCAS[g, s, t] <= Cap[g]
        
        # Constraint 7: Limit storage generation plus RaiseFCAS to available storage
        StorGen_RaiseFCAS_con = Equation(container=m, name="StorGen_RaiseFCAS_con", domain=[s, t])
        StorGen_RaiseFCAS_con[s, t] = StorGen[s, t] + RaiseFCAS_Stor[s, t] <= Storage[s, t]

        # Constraint 8: Ensure LowerFCAS does not exceed available storage charge
        LowerFCAS_Stor_con2 = Equation(container=m, name="LowerFCAS_Stor_con2", domain=[s, t])
        LowerFCAS_Stor_con2[s, t] = LowerFCAS_Stor[s, t] >= Storage[s, t]

        # Constraint 9: Total RaiseFCAS (generation + storage) must cover largest unit contingency
        # Constraint 10: Total LowerFCAS must account for a portion of renewable generation
        RaiseFCAS_total_con = Equation(container=m, name="RaiseFCAS_total_con", domain=[g, s, t])
        LowerFCAS_total_con = Equation(container=m, name="LowerFCAS_total_con", domain=[g, s, t])
        if "Coal" in list(gen_data_df.index.unique()):
            RaiseFCAS_total_con[g, s, t] = RaiseFCAS["Coal", s, t] + RaiseFCAS_Stor[s, t] >= coeff_re_fcas * Sum(RE, Gen[RE, s, t])
            LowerFCAS_total_con[g, s, t] = LowerFCAS["Coal", s, t] + LowerFCAS_Stor[s, t] >= coeff_re_fcas * Sum(RE, Gen[RE, s, t])

        else:
            RaiseFCAS_total_con[g, s, t] = RaiseFCAS_Stor[s, t] >= coeff_re_fcas * Sum(RE, Gen[RE, s, t])
            LowerFCAS_total_con[g, s, t] = LowerFCAS_Stor[s, t] >= coeff_re_fcas * Sum(RE, Gen[RE, s, t])


    if emission_constraint is not None:
        # Emission constraint
        EmissionCon = Equation(container=m, name="EmissionCon")
        EmissionCon[...] = Sum((g, s, t), Gen[g, s, t] * gen_data["Emission"][g] * probability_scenario[s]) * extension_factor <= emission_constraint * Sum(t, load_profile[t]) * extension_factor

    # -------------------------

    # Define the objective function
    obj = Sum((g, s, t), Gen[g, s, t] * gen_data["Opex"][g] * extension_factor * probability_scenario[s]) + Sum((s, t), (Unmet[s, t] * cost_unmet + Surplus[s, t] * cost_surplus) * extension_factor * probability_scenario[s]) + Sum(g, Cap[g] * (gen_data["AnnCapex"][g] + gen_data["FOM"][g])) + StorCap * (capex_storage + fom_storage) + social_cost_emission * Sum((g, s, t), Gen[g, s, t] * gen_data["Emission"][g] * extension_factor * probability_scenario[s]) / 1e6
    
    # -------------------------
    # Define and solve the model
    stochastic_model = Model(
        container=m,
        name=name_model,
        equations=m.getEquations(),  # Add all equations to the model
        problem="LP",
        sense=Sense.MIN,
        objective=obj
    )
    # -------------------------
    # Solve the model
    if path_output is not None:
        model_file = os.path.join(path_output, 'model.gms')
    else:
        model_file = 'output/model.gms'
    with open(model_file, "w") as file:
        summary_model = stochastic_model.solve(output=file)

    # -------------------------
    # Retrieve and display results

    # Extract results
    def extract_results(records, column='level'):
        """Extract results from a GAMS records object"""
        column_default = ['level', 'marginal', 'lower', 'upper', 'scale']
        temp = records.drop(columns=[c for c in column_default if c != column])
        if len(temp.columns) > 1:
            temp = temp.set_index([c for c in temp.columns if c != column]).squeeze()
        else:
            temp = float(temp[column].iloc[0])
        return temp
    

    # Generation results
    StorCap_sol = extract_results(StorCap.records)
    Gen_sol = extract_results(Gen.records)
    StorInj_sol = extract_results(StorInj.records)
    StorGen_sol = extract_results(StorGen.records)
    Unmet_sol = extract_results(Unmet.records)
    Surplus_sol = extract_results(Surplus.records)
    Storage = extract_results(Storage.records)
    
    generation = Gen_sol.unstack('g')
    
    generation = concat((generation, 
                         StorInj_sol.rename('storage_inj'), 
                         StorGen_sol.rename('storage_gen'),
                         Storage.rename('storage_status'),
                         Unmet_sol.rename('unmet'), 
                         Surplus_sol.rename('surplus')), 
                        axis=1)
    
    if fcas_constraint is True:
        LowerFCAS = extract_results(LowerFCAS.records).groupby(['s', 't']).sum()
        RaiseFCAS = extract_results(RaiseFCAS.records).groupby(['s', 't']).sum()
        LowerFCAS_Stor = extract_results(LowerFCAS_Stor.records)
        RaiseFCAS_Stor = extract_results(RaiseFCAS_Stor.records)
        
        generation = concat((generation,                   
                            LowerFCAS.rename('lower_fcas'),
                            RaiseFCAS.rename('up_fcas'),
                            LowerFCAS_Stor.rename('lower_fcas_stor'),
                            RaiseFCAS_Stor.rename('up_fcas_stor')),
                            axis=1)
                                
    load_profile_df = load_profile_df.rename_axis('t')
    load_profile_df.index = load_profile_df.index.astype(str)
    generation = generation.reorder_levels(['t', 's'])
    generation = generation.join(load_profile_df, how='inner')
    
    dual_value_demand = extract_results(Demand.records, column='marginal')
    generation = generation.join(dual_value_demand.rename('dual_demand'), how='inner')
    
    emission = (Gen_sol.unstack('g') * gen_data_df['Emission']).sum(axis=1)
    generation = generation.join(emission.rename('emission'), how='inner')


    # Figure    
    if path_output is not None:
        generation.rename(columns={'storage_inj': 'Storage injection', 'storage_gen': 'Storage generation'}, inplace=True)
        
        generation.to_csv(os.path.join(path_output, 'generation_model.csv'))
        xlabel = 'Time (hours)'
        if duration == 'year':
            generation = generation.droplevel('s')
            generation.index = generation.index.astype(int)
            generation = generation.groupby(generation.index // 24).mean()
            xlabel = 'Time (days)'

        # plot_generation_mix(generation, discrete_time=True, path_save=os.path.join(path_output, 'generation_mix_discrete.png'))
        plot_generation_mix(generation, discrete_time=False, path_save=os.path.join(path_output, 'generation_mix.png'), xlabel=xlabel)

    # Calculate total capital expenditure
    Cap_sol = extract_results(Cap.records)
    if isinstance(Cap_sol, float):
        Cap_sol = Series([Cap_sol], index=list(gen_data_df.index.unique()))

    total_capex = (Cap_sol * (gen_data_df['AnnCapex']+ gen_data_df['FOM'])).sum() + StorCap_sol * (capex_storage + fom_storage)
    total_cost = float(summary_model['Objective'].iloc[0])
    emission = (emission.groupby('s').sum() * probability_df * extension_factor).sum() / 1e6
    emission_factor = emission / (load_profile_df.sum() * extension_factor) * 1e6
    cost_emission = emission * social_cost_emission 
    total_opex = total_cost - total_capex - cost_emission
    

    # Display summary
    generation_grouped = (Gen_sol.unstack('g').groupby('s').sum().T * probability_df).sum(axis=1) * extension_factor
    
    summary = {i: [Cap_sol[i], generation_grouped.loc[i], gen_data_df["AnnCapex"][i] * Cap_sol[i], gen_data_df["FOM"][i] * Cap_sol[i], gen_data_df["Capex"][i] * Cap_sol[i]] for i in Cap_sol.index}
    summary.update({"Storage": [StorCap_sol, 0, capex_storage * StorCap_sol, fom_storage * StorCap_sol, storage_cost_df['Capex' ] * StorCap_sol]})
    summary = DataFrame(summary).T
    summary.columns = ['Capacities (kW)', 'Generation (kWh)', 'Capex ($/y)', 'FOM ($/y)', 'Total capex ($)']

    summary.loc['Total'] = summary.sum()
    summary.loc['Total', 'Emission factor (gCO2/kWh)'] = emission_factor
    summary.loc['Total', 'Emission (tCO2/y)'] = emission
    summary.loc['Total', 'Expected cost emission ($/y)'] = cost_emission
    summary.loc['Total', 'Expected opex ($/y)'] = total_opex
    summary.loc['Total', 'Expected private cost ($/y)'] = total_cost - cost_emission
    summary.loc['Total', 'Expected social cost ($/y)'] = total_cost
    
    if emission_constraint is not None:
        shadow_price_carbon = - extract_results(EmissionCon.records, column='marginal') * 1e6
        summary.loc['Total', 'Shadow price carbon ($/tCO2)'] = shadow_price_carbon
    
    if path_output is not None:
        summary.to_csv(os.path.join(path_output, 'summary.csv'))
        
    print('End of model: {}'.format(name_model))

    return summary

def run_model_wrapper(args):
    
    start_time = time.time()
    
    s, values, input_model_run = args    
    result = run_model(name_model=s, **values, **input_model_run)
    
    elapsed_time = time.time() - start_time

    return s, result, elapsed_time

if __name__ == '__main__':
    import logging
    import time
    
    # Set up logging to a file
    logging.basicConfig(filename='process_log.log', level=logging.INFO, 
                        format='%(asctime)s - %(message)s')

    # Start time of the script
    start_time = time.time()
    logging.info("Process started")
    
    folder = 'output'
    if not os.path.exists(folder):
        os.mkdir(folder)
    
    input_model = {
        'china': {
            'generation_cost': 'generation_cost/generation_cost_china.csv',
            'load_profile': 'load_profile/load_profile_china.csv',
            'production_profile_solar': 'production_profile/production_profile_solar_china.csv',
            'production_profile_wind': 'production_profile/production_profile_wind_china.csv',
            'storage_cost': 'generation_cost/storage_cost_china.csv',
            'probability': 'production_profile/probability_china.csv',
            'duration': 'day'
            },
        'india': {
            'generation_cost': 'generation_cost/generation_cost_india.csv',
            'load_profile': 'load_profile/load_profile_india_year.csv',
            'production_profile_solar': 'production_profile/production_profile_solar_india_year.csv',
            'production_profile_wind': 'production_profile/production_profile_wind_india_year.csv',
            'storage_cost': 'generation_cost/storage_cost_india.csv',
            'duration': 'year'
            }
    }

    run, test, cpu = 'india', False, 2 # 'india'

    if cpu is None:
        cpu = max(cpu_count() - 2, 1) 
        
    if not test:
        folder = os.path.join('output', run)
        if not os.path.exists(folder):
            os.mkdir(folder)

        scenarios = {'deterministic': {'deterministic': True, 'power_plants': None, 'path_output': folder},
                    'deterministic_no_fcas': {'deterministic': True, 'power_plants': None, 'path_output': folder, 'fcas_constraint': False},
                    'deterministic_renewable': {'deterministic': True, 'power_plants': ['Solar', 'Wind'], 'path_output': folder},
                    'deterministic_renewable_no_fcas': {'deterministic': True, 'power_plants': ['Solar', 'Wind'], 'path_output': folder, 'fcas_constraint': False},
                    'deterministic_solar': {'deterministic': True, 'power_plants': ['Solar'], 'path_output': folder},
                    'stochastic': {'deterministic': False, 'power_plants': None},
                    'stochastic_renewable': {'deterministic': False, 'power_plants': ['Solar', 'Wind']},
                    'stochastic_solar': {'deterministic': False, 'power_plants': ['Solar']}
                     }
        scenarios_carbon = {'deterministic_{}'.format(i): {'deterministic': True, 'power_plants': None, 'path_output': None, 'emission_constraint': i} for i in [None] + list(range(50, 400, 50))}
        scenarios.update(scenarios_carbon)
        
        scenarios = {
                    'deterministic': {'deterministic': True, 'power_plants': None},
                    'deterministic_no_fcas': {'deterministic': True, 'power_plants': None, 'fcas_constraint': False},
                    'deterministic_cstr': {'deterministic': True, 'power_plants': None, 'emission_constraint': 100},
                    'stochastic': {'deterministic': False, 'power_plants': None},
                    'stochastic_no_fcas': {'deterministic': False, 'power_plants': None, 'fcas_constraint': False},
                    'stochastic_emission_cstr': {'deterministic': False, 'power_plants': None, 'emission_constraint': 100}
        }
        
        args = [(s, values, input_model[run]) for s, values in scenarios.items()]

        # Use a pool of workers to run the calculations in parallel
        with Pool(cpu) as pool:
            results = pool.map(run_model_wrapper, args)

        # Combine the results into a dictionary
        results_dict = {s: result for s, result, _ in results}

        # Merge the results into a single DataFrame
        merged_results = concat(results_dict.values(), axis=0)
        
        """results = {s: run_model(name_model=s, **values, **input_model[run]) for s, values in scenarios.items()}
        results = concat(results, axis=0)"""
        merged_results.to_csv(os.path.join(folder, 'summary_scenarios_{}.csv'.format(run)))
        
        run_times = {s: elapsed_time for s, _, elapsed_time in results}
        # Save the run times to a file
        with open(os.path.join(folder, 'run_times_{}.csv'.format(run)), 'w') as file:
            for s, elapsed_time in run_times.items():
                file.write(f"{s},{elapsed_time}\n")
        
    else:
        folder = os.path.join('output', 'test')
        if not os.path.exists(folder):
            os.mkdir(folder)
        #run_model(name_model='test', deterministic=True, power_plants=None, path_output=folder, duration='day', **input_model[run])
        summary = run_model(name_model='test', deterministic=False, power_plants=None, path_output=None, fcas_constraint=True, **input_model[run])
        summary.to_csv(os.path.join(folder, 'summary_test.csv'))
    
    # Log the end of the process and the duration
    logging.info("Process finished")
    logging.info(f"Total processing time: {time.time() - start_time:.2f} seconds")
    