import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import linregress

def draw_plot():
    # Read data from file
    df = pd.read_csv('epa-sea-level.csv')

    # Create scatter plot
    plt.scatter(x=df['Year'],y= df['CSIRO Adjusted Sea Level'])

    # Create first line of best fit
    slope, intercept, r_value, p_value, std_err = linregress(df['Year'],df['CSIRO Adjusted Sea Level'])
    x2=np.arange(1880,2051)
    x3=np.arange(2000,2051)

    #print(df)
    plt.plot(x2, intercept + slope * x2, 'r', label='fitted line')
    plt.xlim([1870, 2070])

    # Create second line of best fit
    df2=df.loc[(df['Year']>= 2000)]
    slope2, intercept2, r_value2, p_value2, std_err2 = linregress(df2['Year'], df2['CSIRO Adjusted Sea Level'])
    plt.plot(x3, intercept2 + slope2 * x3, 'g', label='fitted line')


    # Add labels and title
    plt.xlabel('Year')
    plt.ylabel('Sea Level (inches)')
    plt.title('Rise in Sea Level')
    
    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()

