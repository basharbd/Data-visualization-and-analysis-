# -*- coding: utf-8 -*-
"""
Created on Sat Jun 25 18:02:58 2022

@author: basha
"""

# Encoding categorical features.
# -----------------------------------------------------------------------------

# OrdinalEncoder.
import numpy as np
import pandas as pd
from sklearn import preprocessing

from sklearn.preprocessing import OrdinalEncoder
enc = preprocessing.OrdinalEncoder()
X = [['male', 'from US', 'uses Safari'], ['female', 'from Europe', 'uses Firefox']]
enc.fit(X)

enc.transform([['female', 'from US', 'uses Safari']])






# OneHotEncoder.
from sklearn.preprocessing import OneHotEncoder
enc = preprocessing.OneHotEncoder()
X = [['male', 'from US', 'uses Safari'], ['female', 'from Europe', 'uses Firefox']]
enc.fit(X)
enc.transform([['female', 'from US', 'uses Safari'],
               ['male', 'from Europe', 'uses Safari']]).toarray()










#categorical vs categorical data
# ----------------------------------------------------------------------------
import seaborn as sns
titanic = sns.load_dataset("titanic")
sns.catplot(x="sex", y="survived", hue="class", kind="bar", data=titanic)


#quantitative vs quantitative data
# -----------------------------------------------------------------------------
penguins = sns.load_dataset("penguins")
sns.jointplot(data=penguins, x="bill_length_mm", y="bill_depth_mm")


#quantitative vs categorical
# -----------------------------------------------------------------------------
penguins = sns.load_dataset("penguins")
sns.displot(penguins, x="flipper_length_mm", hue="sex", multiple="dodge")







