#' Energy Planning Stochastic Model
#' This script defines a GAMS model for the power system with stochastic renewable generation.

import os, sys
from gamspy import Container, Set, Parameter, Variable, Equation, Model, Sense, Sum, Options, Ord
from pandas import read_csv, concat, Series, DataFrame, concat, Index
import matplotlib.pyplot as plt


def run_model(name_model='ChinaStochasticModel', deterministic=False, power_plants=None, 
              path_output=None, generation_cost=None, load_profile=None, production_profile_solar=None, production_profile_wind=None, 
              storage_cost=None, probability=None):
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
    
    Returns:
    - summary: pandas DataFrame with the summary of the model results
    """
    print('Running model: {}'.format(name_model))
    # Input files structure
    folder_input = 'input'

    if path_output is not None: 
        path_output = os.path.join(path_output, name_model)
        if not os.path.exists(path_output):
            os.makedirs(path_output)

    # Model parameters
    cost_unmet, cost_surplus = 1, 0.15 # $/kWh, $/kWh
    rampup_coal, rampdown_coal = 1.5, 0.5 # doesn't work in the current version
    min_gen_coal_coef = 0.4
    coal_ramp, min_gen_coal, total_capacity_constraint = True, True, True

    # Loading data
    load_profile_df = read_csv(os.path.join(folder_input, load_profile), index_col=0)
    gen_data_df = read_csv(os.path.join(folder_input, generation_cost), header=[1], index_col=0)
    storage_cost_df = read_csv(os.path.join(folder_input, storage_cost), index_col=0, header=None).iloc[:, 1]
    
    production_profile_solar_df = read_csv(os.path.join(folder_input, production_profile_solar), index_col=0)
    production_profile_wind_df = read_csv(os.path.join(folder_input, production_profile_wind), index_col=0)
    if probability is not None:
        probability_df = read_csv(os.path.join(folder_input, probability), index_col=0)
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
            probability_df = probability_df.loc['Avg'].to_frame().T
            probability_df.loc['Avg'] = 1
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

    # Define sets
    g = Set(container=m, name='g', records=list(gen_data_df.index.unique()), description='Generation technologies')
    RE = Set(container=m, name='RE', domain=g, records=[i for i in list(gen_data_df.index.unique()) if i in ['Solar', 'Wind']], description='Renewable generation technologies')
    t = Set(container=m, name='t', records=[str(i) for i in range(1, 25)], description='24 time steps')
    s = Set(container=m, name='s', records=list(probability_df.index.unique()), description='Renewable generation scenarios')

    # Define parameters
    list_parameters = ['Capex', 'FOM', 'Opex', 'Life', 'WACC', 'AnnCapex', 'Load', 'Solar', 'Wind']
    gen_data = {i: Parameter(container=m, name=i, domain=g, records=gen_data_df[i].reset_index()) for i in gen_data_df.columns if i in list_parameters}
    
    
    production_profile = Parameter(container=m, name='ProductionProfile', domain=[RE, t, s], records=production_profile_df)
    load_profile = Parameter(container=m, name='Load', domain=t, records=load_profile_df.reset_index())

    probability_scenario = Parameter(container=m, name='Prob', domain=[s], records=probability_df.reset_index())

    # Define variables
    Cap = Variable(container=m, name='Cap', domain=[g], type="Positive")
    Gen = Variable(container=m, name='Gen', domain=[g, s, t], type="Positive")
    StorCap = Variable(container=m, name='StorCap', type="Positive")
    Storage = Variable(container=m, name='Storage', domain=[s, t], type="Positive")
    Storage.l[s, '1'] = 0
    StorInj = Variable(container=m, name='StorInj', domain=[s, t], type="Positive")
    StorGen = Variable(container=m, name='StorGen', domain=[s, t], type="Positive")
    Unmet = Variable(container=m, name='Unmet', domain=[s, t], type="Positive")
    Surplus = Variable(container=m, name='Surplus', domain=[s, t], type="Positive")
    #Cost = Variable(container=m, name='Cost')

    # Define the Demand equation
    Demand = Equation(container=m, name="Demand", domain=[s, t])
    Demand[s, t] = Sum(g, Gen[g, s, t]) + StorGen[s, t] * efficiency_storage + Unmet[s, t] - Surplus[s, t] == load_profile[t] + StorInj[s, t]

    # Define the Storage Balance equation
    StorBal = Equation(container=m, name="StorBal", domain=[s, t])
    StorBal[s, t] = Storage[s, t] == Storage[s, t.lag(1)] + StorInj[s, t] - StorGen[s, t]

    # Storage Limit equation
    StorLim = Equation(container=m, name="StorLim", domain=[s, t])
    StorLim[s, t] = Storage[s, t] <= StorCap

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

    # Define the objective function
    obj = Sum((g, s, t), Gen[g, s, t] * gen_data["Opex"][g] * 365 * probability_scenario[s]) + Sum((s, t), (Unmet[s, t] * cost_unmet + Surplus[s, t] * cost_surplus) * 365 * probability_scenario[s]) + Sum(g, Cap[g] * (gen_data["AnnCapex"][g] + gen_data["FOM"][g])) + StorCap * (capex_storage + fom_storage)
            
    # Define and solve the model
    stochastic_model = Model(
        container=m,
        name=name_model,
        equations=m.getEquations(),  # Add all equations to the model
        problem="LP",
        sense=Sense.MIN,
        objective=obj
    )

    # Solve the model
    summary_model = stochastic_model.solve()

    # Retrieve and display results

    # Extract results
    def extract_results(records):
        """Extract results from a GAMS records object"""
        temp = records.drop(columns=['marginal', 'lower', 'upper', 'scale'])
        if len(temp.columns) > 1:
            temp = temp.set_index([c for c in temp.columns if c != 'level']).squeeze()
        else:
            temp = float(temp['level'].iloc[0])
        return temp

    # Generation results
    StorCap_sol = extract_results(StorCap.records)
    Gen_sol = extract_results(Gen.records)
    StorInj_sol = extract_results(StorInj.records)
    StorGen_sol = extract_results(StorGen.records)
    Unmet_sol = extract_results(Unmet.records)
    Surplus_sol = extract_results(Surplus.records)

    generation = Gen_sol.unstack('g')
    generation = concat((generation, StorInj_sol.rename('storage_inj'), StorGen_sol.rename('storage_gen'),Unmet_sol.rename('unmet'), Surplus_sol.rename('surplus')), axis=1)

    load_profile_df = load_profile_df.rename_axis('t')
    load_profile_df.index = load_profile_df.index.astype(str)
    generation = generation.reorder_levels(['t', 's'])
    generation = generation.join(load_profile_df, how='inner')
    
    if path_output is not None:
        generation.rename(columns={'storage_inj': 'Storage injection', 'storage_gen': 'Storage generation'}, inplace=True)
        
        generation.to_csv(os.path.join(path_output, 'generation_model.csv'))
        plot_generation_mix(generation, discrete_time=True, path_save=os.path.join(path_output, 'generation_mix_discrete.png'))
        plot_generation_mix(generation, discrete_time=False, path_save=os.path.join(path_output, 'generation_mix.png'))

    # Calculate total capital expenditure
    Cap_sol = extract_results(Cap.records)
    if isinstance(Cap_sol, float):
        Cap_sol = Series([Cap_sol], index=list(gen_data_df.index.unique()))

    total_capex = (Cap_sol * (gen_data_df['AnnCapex']+ gen_data_df['FOM'])).sum() + StorCap_sol * (capex_storage + fom_storage)
    total_cost = float(summary_model['Objective'].iloc[0])
    total_opex = total_cost - total_capex

    # Display summary
    summary = {i: [Cap_sol[i], gen_data_df["AnnCapex"][i] * Cap_sol[i], gen_data_df["FOM"][i] * Cap_sol[i]] for i in Cap_sol.index}
    summary.update({"Storage": [StorCap_sol, capex_storage * StorCap_sol, fom_storage * StorCap_sol]})
    summary = DataFrame(summary).T
    summary.columns = ['Capacities (kW)', 'Capex ($/y)', 'FOM ($/y)']

    summary.loc['Total'] = summary.sum()
    summary.loc['Total', 'Expected opex ($/y)'] = total_opex
    summary.loc['Total', 'Expected cost ($/y)'] = total_cost
    
    if path_output is not None:
        summary.to_csv(os.path.join(path_output, 'summary.csv'))

    return summary


def plot_generation_mix(df, discrete_time=True, path_save='output/generation_mix.png'):
    """
    Plots the generation mix and load curve from a pandas DataFrame in a flexible and replicable way.
    
    Parameters:
    - df: pandas DataFrame containing generation technologies and 'Load', indexed by time steps.
    - discrete_time: Boolean, if True the time is treated as discrete (bar plot); if False, time is continuous (area plot).
    """


    # Define a dictionary for standard colors based on IEA or common practice
    color_dict = {
        'Coal': 'black',
        'Solar': 'yellow',
        'Wind': 'lightgreen',
        'Storage generation': 'lightblue',
        'Hydro': 'blue',
        'Gas': 'gey',
        'Nuclear': 'orange',
        'Biomass': 'brown',
        'Geothermal': 'purple'
    }
    
    # Extract time steps and load data
    time_steps = df.index.get_level_values('t')
    load = df['Load']

    # Define the generation technologies from the DataFrame (all columns except 'Load')
    power_plants = [col for col in df.columns if col != 'Load' and col in color_dict.keys()]

    # Check if all power plants are in the color_dict, assign default color if missing
    colors = [color_dict.get(plant, 'gray') for plant in power_plants]

    plt.figure(figsize=(10, 6))

    # Plot the generation data as a stacked bar or area plot depending on `discrete_time`
    if discrete_time:
        bottom = [0] * len(time_steps)  # Initialize the bottom for stacking bars
        for i, plant in enumerate(power_plants):
            plt.bar(time_steps, df[plant], bottom=bottom, color=colors[i], label=plant)
            bottom = [a + b for a, b in zip(bottom, df[plant])]
    else:
        # For continuous time, use a stacked area plot
        plt.stackplot(time_steps, *[df[plant] for plant in power_plants], labels=power_plants, colors=colors)

    # Plot the load curve (line plot)
    plt.plot(time_steps, load, color="red", label="Load", linewidth=2, linestyle="--")

    # Labels and Title
    plt.xlabel("Time (hours)")
    plt.ylabel("Generation / Load (GW)")
    plt.title("Generation Mix and Load")

    # Legend
    plt.legend()

    # Show plot
    plt.tight_layout()
    plt.savefig(path_save)
    plt.close()


if __name__ == '__main__':
    
    run = 'india' # 'india'
    
    folder = 'output'
    if not os.path.exists(folder):
        os.mkdir(folder)
    
    input_model = None
    if run == 'china':
        input_china = {
            'generation_cost': 'generation_cost/generation_cost_china.csv',
            'load_profile': 'load_profile/load_profile_china.csv',
            'production_profile_solar': 'production_profile/production_profile_solar_china.csv',
            'production_profile_wind': 'production_profile/production_profile_wind_china.csv',
            'storage_cost': 'generation_cost/storage_cost_china.csv',
            'probability': 'production_profile/probability_china.csv'
            }
        input_model = input_china
    elif run == 'india':
        input_india = {
            'generation_cost': 'generation_cost/generation_cost_india.csv',
            'load_profile': 'load_profile/load_profile_india.csv',
            'production_profile_solar': 'production_profile/production_profile_solar_india.csv',
            'production_profile_wind': 'production_profile/production_profile_wind_india.csv',
            'storage_cost': 'generation_cost/storage_cost_india.csv',
            }
        input_model = input_india
    
    if True:
        folder = os.path.join('output', run)
        if not os.path.exists(folder):
            os.mkdir(folder)
        
        scenarios = {'deterministic_optimal': {'deterministic': True, 'power_plants': None, 'path_output': folder},
                    'deterministic_renewable': {'deterministic': True, 'power_plants': ['Solar', 'Wind'], 'path_output': folder},
                        'stochastic_optimal': {'deterministic': False, 'power_plants': None},
                        'stochastic_renewable': {'deterministic': False, 'power_plants': ['Solar', 'Wind']}
                        }

        results = {s: run_model(name_model=s, **values, **input_model) for s, values in scenarios.items()}
        results = concat(results, axis=0)
        results.to_csv(os.path.join(folder, 'summary_scenarios_{}.csv'.format(run)))
    else:
        folder = os.path.join('output', 'test')
        if not os.path.exists(folder):
            os.mkdir(folder)
        run_model(name_model='test', deterministic=False, power_plants=None, path_output=folder, **input_china)

print('End of script')
