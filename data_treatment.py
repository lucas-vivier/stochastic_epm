
import pandas as pd



if __name__ == '__main__':

    folder = 'export_renewable_data/india_use_case/data_india_use_case_wind.csv'
    data = pd.read_csv(folder, index_col=[0, 1, 2])
    
    capacity_factor = data.mean()
    
    # Calculate P10, P50, P90.
    stat = {'P10': capacity_factor.quantile(0.9), 'P50': capacity_factor.median(), 'P90': capacity_factor.quantile(0.1)}
    
    capacity_factor_actual = 0.3 
    
    scale = capacity_factor_actual / stat['P50']
    data *= scale
    
    data.to_csv(folder.replace('.csv', '_scaled.csv'))
        
    