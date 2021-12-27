import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Import data
df = pd.read_csv('medical_examination.csv')

# Add 'overweight' column
'''
Add an overweight column to the data. To determine if a person is overweight, first calculate their 
BMI by dividing their weight in kilograms by the square of their height in meters. If that value is > 25 
then the person is overweight. Use the value 0 for NOT overweight and the value 1 for overweight.
'''
df['overweight'] = df['weight']/((df['height']/100)**2)
df.loc[df['overweight']<=25,'overweight']=0
df.loc[df['overweight']>25,'overweight']=1


# Normalize data by making 0 always good and 1 always bad. If the value of 'cholesterol' or 'gluc' is 1, make the value 0. If the value is more than 1, make the value 1.
'''
Normalize the data by making 0 always good and 1 always bad. If the value of cholesterol
 or gluc is 1, make the value 0. If the value is more than 1, make the value 1.
'''
df['gluc']=df['gluc'].apply(lambda x: 0 if x==1 else 1)
df.loc[df['cholesterol']<=1,'cholesterol']=0
df.loc[df['cholesterol']>1,'cholesterol']=1

# Draw Categorical Plot
'''
Convert the data into long format and create a chart that shows the value counts of the categorical
features using seaborn's catplot(). The dataset should be split by 'Cardio' so there is one chart for 
each cardio value. The chart should look like examples/Figure_1.png.
'''
def draw_cat_plot():
    # Create DataFrame for cat plot using `pd.melt` using just the values from 'cholesterol', 'gluc', 'smoke', 'alco', 'active', and 'overweight'.
    df_cat = pd.melt(df, id_vars=['cardio'], value_vars=['cholesterol', 'gluc', 'smoke', 'alco', 'active', 'overweight'])

    # Group and reformat the data to split it by 'cardio'. Show the counts of each feature. You will have to rename one of the columns for the catplot to work correctly.
    df_cat=df_cat.groupby(['cardio','variable','value'],as_index=False).size()
    df_cat=df_cat.rename(columns={"size": "total"})
    df_cat['value'] = df_cat['value'].astype(int)


    # Draw the catplot with 'sns.catplot()'
    fig=sns.catplot(x='variable',y='total', hue='value', col='cardio',data=df_cat,
                kind="bar").fig


    # Do not modify the next two lines
    fig.savefig('catplot.png')
    return fig

#draw_cat_plot()
# Draw Heat Map
def draw_heat_map():
    # Clean the data
    '''
    Clean the data. Filter out the following patient segments that represent incorrect data:

    diastolic pressure is higher than systolic (Keep the correct data with (df['ap_lo'] <= df['ap_hi']))
    height is less than the 2.5th percentile (Keep the correct data with (df['height'] >= df['height'].quantile(0.025)))
    height is more than the 97.5th percentile
    weight is less than the 2.5th percentile
    weight is more than the 97.5th percentile
    '''

    df_heat = df.loc[
        (df['ap_lo'] <= df['ap_hi']) &
        (df['height'] >= df['height'].quantile(0.025))&
        (df['height'] <= df['height'].quantile(0.975))&
        (df['weight'] >= df['weight'].quantile(0.025))&
        (df['weight'] <= df['weight'].quantile(0.975))
    ]

    # Calculate the correlation matrix
    corr = df_heat.corr(method='pearson')

    # Generate a mask for the upper triangle
    mask = np.triu(corr)



    # Set up the matplotlib figure
    fig, ax = plt.subplots()

    # Draw the heatmap with 'sns.heatmap()'
    sns.set(font_scale=0.6)

    heatmap=sns.heatmap(corr,mask=mask,square=True,annot=True,linewidths=0.5,fmt="0.1f",center=0,vmax=0.3,vmin=-0.15,cbar_kws={'shrink': 0.55,"ticks":[-0.08,0.24,0.08,0.00,0.16]},annot_kws={"size": 5})
    heatmap.set_xticklabels(heatmap.get_xticklabels(), size=5)
    heatmap.set_yticklabels(heatmap.get_yticklabels(), size=5)

    # Do not modify the next two lines
    fig.savefig('heatmap.png')
    return fig

#draw_heat_map()