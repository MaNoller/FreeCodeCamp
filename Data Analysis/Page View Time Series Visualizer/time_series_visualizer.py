import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import numpy as np
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

# Import data (Make sure to parse dates. Consider setting index column to 'date'.)
df = pd.read_csv('fcc-forum-pageviews.csv')
df['date'] = pd.to_datetime(df['date'])
df.set_index('date', inplace=True)



# Clean data
'''
Clean the data by filtering out days when the page views were
in the top 2.5% of the dataset or bottom 2.5% of the dataset.
'''
df = df.loc[
    (df['value'] <= df['value'].quantile(0.975))&
    (df['value'] >= df['value'].quantile(0.025))
]



def draw_line_plot():
    # Draw line plot
    '''
    Create a draw_line_plot function that uses Matplotlib to draw a line chart similar to "examples/Figure_1.png".
    The title should be "Daily freeCodeCamp Forum Page Views 5/2016-12/2019". The label on the x axis
    should be "Date" and the label on the y axis should be "Page Views".
    '''
    fig = plt.figure(figsize=(17,5.4))
    plt.plot(df.index,df['value'],color='r')
    plt.xlabel('Date')
    plt.ylabel('Page Views')
    plt.title('Daily freeCodeCamp Forum Page Views 5/2016-12/2019')




    # Save image and return fig (don't change this part)
    fig.savefig('line_plot.png')
    return fig

def draw_bar_plot():
    '''
    Create a draw_bar_plot function that draws a bar chart similar to
    "examples/Figure_2.png". It should show average daily page views for each month
    grouped by year. The legend should show month labels and have a title of "Months".
    On the chart, the label on the x axis should be "Years" and the label on the y axis
    should be "Average Page Views".
    '''
    # Copy and modify data for monthly bar plot
    #df_bar = df.groupby([pd.Grouper(freq='A'),pd.Grouper(freq='M')]).mean() # Hier fail aber gut zu wissen!
    df2=df.copy()
    df2['year']=df2.index.year
    df2['month'] = df2.index.month
    #df['month']=df['month'].apply() -> mal sehen ob benötigt..?
    df_bar=df2.groupby(['year','month']).mean()
    df_bar['value'] = df_bar['value'].astype(int)
    df_bar=df_bar.unstack()

    # Draw bar plot
    fig=df_bar.plot(kind='bar',figsize=(7,6)).figure
    plt.xlabel('Years')
    plt.ylabel('Average Page Views')
    plt.legend(labels=["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],title='Months',fontsize='small')



    # Save image and return fig (don't change this part)
    fig.savefig('bar_plot.png')
    return fig

def draw_box_plot():
    # Prepare data for box plots (this part is done!)

    df_box = df.copy()
    df_box.reset_index(inplace=True)
    df_box['year'] = [d.year for d in df_box.date]
    df_box['month'] = [d.strftime('%b') for d in df_box.date]


    # Draw box plots (using Seaborn)
    '''
    Create a draw_box_plot function that uses Searborn to draw two adjacent box plots
     similar to "examples/Figure_3.png". These box plots should show how the values are 
     distributed within a given year or month and how it compares over time. The title of 
     the first chart should be "Year-wise Box Plot (Trend)" and the title of the second 
     chart should be "Month-wise Box Plot (Seasonality)". Make sure the month labels on 
     bottom start at "Jan" and the x and x axis are labeled correctly.
    '''

    df_box['month'] = pd.Categorical(df_box['month'],
                                 ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])
    df_box.sort_values("month")
    fig, axs = plt.subplots(ncols=2,figsize=(15,5))
    sns.boxplot(x='year', y='value', data=df_box, ax=axs[0],linewidth=.5,fliersize=1)
    sns.boxplot(x='month', y='value', data=df_box, ax=axs[1],linewidth=.5,fliersize=1)
    axs[0].set_yticks(np.arange(0, 220000, 20000))
    axs[1].set_yticks(np.arange(0, 220000, 20000))
    axs[0].set_title('Year-wise Box Plot (Trend)',fontsize=10)
    axs[1].set_title('Month-wise Box Plot (Seasonality)',fontsize=10)
    axs[0].set_xlabel('Year',fontsize=8)
    axs[1].set_xlabel('Month',fontsize=8)
    axs[0].set_ylabel('Page Views',fontsize=8)
    axs[1].set_ylabel('Page Views',fontsize=8)
    #axs[0].set(ylim=(0, 200000))
    #axs[1].set(ylim=(0, 200000))

    # Save image and return fig (don't change this part)
    fig.savefig('box_plot.png')
    return fig

draw_box_plot()