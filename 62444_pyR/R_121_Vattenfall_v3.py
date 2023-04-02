# -*- coding: utf-8 -*-
"""
Created on Sat Jun 25 23:32:15 2022

@author: basha
"""
import numpy as np
import pandas as pd
from sklearn import preprocessing
import matplotlib.pyplot as plt




# importing pandas as pd
import pandas as pd
  
# read an excel file and convert 
# into a dataframe object
df = pd.DataFrame(pd.read_excel("Vattenfall_-_Main_Component_Exchange_Database_v3.xlsx"))
  
# show the dataframe
df


#importing pandas as pd
import pandas as pd

# Read and store content
# of an excel file
read_file = pd.read_excel ("Vattenfall_-_Main_Component_Exchange_Database_v3.xlsx")

# Write the dataframe object
# into csv file
read_file.to_csv ("Vattenfall_-_Main_Component_Exchange_Database_v3.csv",
				index = None,
				header=True)
	
# read csv file and convert
# into a dataframe object
df = pd.DataFrame(pd.read_csv("Vattenfall_-_Main_Component_Exchange_Database_v3.csv"))

# show the dataframe
df



df.values  
print(df.describe())
df.head()

import seaborn as sns

sns.jointplot(data=df, x="Turbine Stopp Date", y="Component Exchange Date")


#quantitative vs categorical

sns.displot(df, x="Component Exchange Date", hue="Component Failed", multiple="dodge")
















