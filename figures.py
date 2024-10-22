from matplotlib import pyplot as plt

def plot_generation_mix(df, discrete_time=True, path_save='output/generation_mix.png', xlabel="Time (hours)"):
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
    plt.xlabel(xlabel)
    plt.ylabel("Generation / Load (kW)")
    plt.title("Generation Mix and Load")

    # Legend
    plt.legend()

    # Show plot
    plt.tight_layout()
    plt.savefig(path_save)
    plt.close()