#' This script is used to fetch solar or wind power data for multiple locations using the Renewables Ninja API.
# The API requires an API token, which you can get by signing up at https://www.renewables.ninja/.
# The API allows you to fetch hourly solar or wind power data for a given location, time period, and power system configuration.
# The data is returned in JSON format, which can be easily converted to a Pandas DataFrame.
# The function get_renewable_data() fetches the data for multiple locations and returns a dictionary of results for each location.
# The function also handles rate limiting by waiting for a minute if the rate limit is hit.
# The data is then saved to a CSV file for further analysis.
# Author: Lucas Vivier: lvivier@worldbank.org

import requests
import pandas as pd
import time

API_TOKEN = '38bb40c2e0090463d92457a7bb87af45fdbba28b'  

def get_renewable_data(power_type, locations, start_date, end_date, api_token=API_TOKEN, dataset="merra2", capacity=1, system_loss=0.1, height=100, tracking=0, tilt=35, azim=180,
                       turbine='Gamesa+G114+2000', local_time='true'):
    """
    Fetch solar or wind power data for multiple locations using the Renewables Ninja API.
    
    Args:
    - api_token (str): Your Renewables Ninja API token.
    - power_type (str): 'solar' or 'wind'.
    - locations (list of tuples): List of locations as (latitude, longitude).
    - start_date (str): Start date in 'YYYY-MM-DD' format.
    - end_date (str): End date in 'YYYY-MM-DD' format.
    - dataset (str): Dataset to use ('merra2' or 'sarah' for solar). Defaults to 'merra2'.
    - capacity (float): Capacity of the power system. Defaults to 1.
    - system_loss (float): System losses (for solar). Defaults to 0.1.
    - height (float): Turbine height (for wind). Defaults to 100.
    - tracking (int): Tracking type for solar (0 for fixed, 1 for single-axis). Defaults to 0.
    - tilt (float): Tilt angle for solar panels. Defaults to 35.
    - azim (float): Azimuth angle for solar panels. Defaults to 180.
    - turbine (str): Turbine type for wind. Defaults to 'Vestas+V80+2000'.
    - local_time (bool): Whether to return data in local time. Defaults to True.
    
    Returns:
    - dict: A dictionary of results for each location.
    """
    base_url = 'https://www.renewables.ninja/api/data/'
    
    # Set headers for the API request
    headers = {
        'Authorization': f'Token {api_token}'
    }
        
    # Track requests per minute
    requests_made = 0
    minute_start_time = time.time()

    all_data = []

    # Iterate over locations
    for lat, lon in locations:
        # Build the request URL based on the power type (solar or wind)
        if power_type == 'solar':
            url = f"{base_url}pv?lat={lat}&lon={lon}&date_from={start_date}&date_to={end_date}&dataset={dataset}&capacity={capacity}&system_loss={system_loss}&tracking={tracking}&tilt={tilt}&azim={azim}&local_time={local_time}&format=json"
        elif power_type == 'wind':
            url = f"{base_url}wind?lat={lat}&lon={lon}&date_from={start_date}&date_to={end_date}&dataset={dataset}&capacity={capacity}&height={height}&turbine={turbine}&local_time={local_time}&format=json"
        else:
            raise ValueError("Invalid power_type. Choose either 'solar' or 'wind'.")

        # Send the request
        response = requests.get(url, headers=headers)

        # Check for successful response
        if response.status_code == 200:
            data = response.json()
            # Append the data along with location details
            for timestamp, values in data['data'].items():
                row = {
                    'latitude': lat,
                    'longitude': lon,
                    'timestamp': pd.to_datetime(int(timestamp) / 1000, unit='s'),
                    #'local_time': pd.to_datetime(int(local_time) / 1000, unit='s'),
                    **values  # Unpack all the power generation data at that timestamp
                }
                all_data.append(row)
        else:
            print(f"Error fetching data for location ({lat}, {lon}): {response.status_code}")
            
        # Track the request
        requests_made += 1
        
        # If we hit 6 requests within a minute, we wait for the remaining time of that minute
        if requests_made >= 6:
            print('Waiting for a minute to not hit the API rate limit...')
            elapsed_time = time.time() - minute_start_time
            if elapsed_time < 60:
                sleep_time = 60 - elapsed_time
                print(f"Hit rate limit. Sleeping for {sleep_time:.2f} seconds.")
                time.sleep(sleep_time)

            # Reset the counter and timer
            requests_made = 0
            minute_start_time = time.time()
    
    # Convert the collected data into a DataFrame
    df = pd.DataFrame(all_data)
    df.rename(columns={'electricity': power_type}, inplace=True)
    return df
    

if __name__ == '__main__':
    import os
    from pandas import concat
    # Example usage:
    name_data = "india_use_case"
    locations = [(14.4602, 77.4494)]   # List of (latitude, longitude) tuples
    power_type = 'solar'  # or 'wind'
    
    output = "export_renewable_data"
    # Make folder
    if not os.path.exists(output):
        os.makedirs(output)
    output = os.path.join(output, name_data)
    if not os.path.exists(output):
        os.makedirs(output)
        
    
    start_day = '01-01'
    end_day = '12-31'
    turbine='Gamesa+G114+2000'
    
    results = {}
    for year in range(1980, 2024):
    #for year in range(2021, 2024):
    
        start_date = '{}-{}'.format(year, start_day)
        end_date = '{}-{}'.format(year, end_day)

        # Call the function to get data
        data = get_renewable_data(power_type, locations, start_date, end_date, turbine=turbine)
        
        if data.empty:
            print("No data for year {}".format(year))
            continue
        else:
            print("Getting data for year {}".format(year))
            data.set_index(['latitude', 'longitude'], inplace=True)
            data['local_time'] = pd.to_datetime(data['local_time'])
            data['time_only'] = data['local_time'].dt.strftime('%m-%d %H:%M:%S')
            data.set_index('time_only', inplace=True, append=True)
            data = data.loc[:, [power_type]]

            results.update({year: data})
    
    # description_export = '{}_lat{}_lon{}'.format(power_type, locations[0][0], locations[0][1])
    
    results = concat(results, axis=1)
    results.to_csv(os.path.join(output, 'data_{}_{}.csv'.format(name_data, power_type)))
    