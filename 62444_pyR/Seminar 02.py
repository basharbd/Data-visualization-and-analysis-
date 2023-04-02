# -*- coding: utf-8 -*-
"""
Created on Wed Jun 15 21:25:25 2022

@author: basha
"""
# Basic python functions
#-----------------------------------------------------------------------------#

# Program to find the sum of all numbers stored in a list

# List of numbers
numbers = [6, 5, 3, 8, 4, 2, 5, 4, 11]

# variable to store the sum
sum = 0

# iterate over the list
for val in numbers:
    sum = sum+val

print("The sum is", sum)





# If the number is positive, we print an appropriate message

num = 3
if num > 0:
    print(num, "is a positive number.")
print("This is always printed.")

num = -1
if num > 0:
    print(num, "is a positive number.")
print("This is also always printed.")





# Example to illustrate the use of else statement with the while loop

counter = 0

while counter < 3:
    print("Inside loop")
    counter = counter + 1
else:
    print("Inside else")
    
    


    
 # basic example of subtractig 2 numbers   
def subtractNum():
    print(34 - 4)
subtractNum()




# importing the required module
import matplotlib.pyplot as plt
	
# x axis values
x = [1,2,3]
# corresponding y axis values
y = [2,4,1]
	
# plotting the points
plt.plot(x, y)
	
# naming the x axis
plt.xlabel('x - axis')
# naming the y axis
plt.ylabel('y - axis')
	
# giving a title to my graph
plt.title('My first graph!')
	
# function to show the plot
plt.show()











# Dimensionality Reduction-Principal Component Analysis PCA OF IRIS Dataset
#------------------------------------------------------------------------------#
import numpy as np
import pandas as pd
import seaborn as sns
sns.set_palette('husl')
import matplotlib.pyplot as plt
%matplotlib inline

from sklearn import metrics




data = pd.read_csv('Iris.csv')

data.head()

data.info()

data.describe()

data['Species'].value_counts()


tmp = data.drop('Id', axis=1)
g = sns.pairplot(tmp, hue='Species', markers='+')
plt.show()



from sklearn.preprocessing import StandardScaler
features = ['SepalLengthCm', 'SepalWidthCm', 'PetalLengthCm', 'PetalWidthCm']
# Separating out the features
x = data.loc[:, features].values
# Separating out the target
y = data.loc[:,['Species']].values
# Standardizing the features
x = StandardScaler().fit_transform(x)


from sklearn.decomposition import PCA
pca = PCA(n_components=2)
principalComponents = pca.fit_transform(x)
principalDf = pd.DataFrame(data = principalComponents
             , columns = ['principal component 1', 'principal component 2'])


finalDf = pd.concat([principalDf, data[['Species']]], axis = 1)

fig = plt.figure(figsize = (8,8))
ax = fig.add_subplot(1,1,1) 
ax.set_xlabel('Principal Component 1', fontsize = 15)
ax.set_ylabel('Principal Component 2', fontsize = 15)
ax.set_title('2 component PCA', fontsize = 20)
targets = ['Iris-setosa', 'Iris-versicolor', 'Iris-virginica']
colors = ['r', 'g', 'b']
for Species, color in zip(targets,colors):
    indicesToKeep = finalDf['Species'] == Species
    ax.scatter(finalDf.loc[indicesToKeep, 'principal component 1']
               , finalDf.loc[indicesToKeep, 'principal component 2']
               , c = color
               , s = 50)
ax.legend(targets)
ax.grid()

pca.explained_variance_ratio_









# Clustring problem
#------------------------------------------------------------------------------#
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.cluster import KMeans
#
# Load Sklearn IRIS dataset
#
iris = datasets.load_iris()
X = iris.data
y = iris.target
#
# Do the scatter plot and see that clusters are evident
#
plt.scatter(X[:,1], X[:,3],
             color='white', marker='o', edgecolor='red', s=50)
plt.grid()
plt.tight_layout()
plt.show()



# Create an instance of K-Means
#
kmc = KMeans(n_clusters=3, init='random', n_init=10, max_iter=300,tol=1e-04, random_state=0)
#
# Fit and make predictions
#
y_kmc = kmc.fit_predict(X)
#
# Create the K-means cluster plot
#
plt.scatter(X[y_kmc == 0, 1], X[y_kmc == 0, 3], s=50,
            c='lightgreen', marker='s', edgecolor='black', label='Cluster 1')
plt.scatter(X[y_kmc == 1, 1], X[y_kmc == 1, 3],
             s=50, c='orange', marker='o', edgecolor='black', label='Cluster 2')
plt.scatter(X[y_kmc == 2, 1], X[y_kmc == 2, 3], s=50,
            c='blue', marker='P', edgecolor='black', label='Cluster 3')
plt.scatter(kmc.cluster_centers_[:, 1], kmc.cluster_centers_[:, 3],
            s=250, marker='*', c='red', edgecolor='black', label='Centroids')
plt.legend(scatterpoints=1)
plt.grid()
plt.tight_layout()
plt.show()








# Regression problem
#-----------------------------------------------------------------------------#
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets, linear_model
from sklearn.metrics import mean_squared_error, r2_score

# Load the diabetes dataset
diabetes_X, diabetes_y = datasets.load_diabetes(return_X_y=True)

# Use only one feature
diabetes_X = diabetes_X[:, np.newaxis, 2]

# Split the data into training/testing sets
diabetes_X_train = diabetes_X[:-20]
diabetes_X_test = diabetes_X[-20:]

# Split the targets into training/testing sets
diabetes_y_train = diabetes_y[:-20]
diabetes_y_test = diabetes_y[-20:]

# Create linear regression object
regr = linear_model.LinearRegression()

# Train the model using the training sets
regr.fit(diabetes_X_train, diabetes_y_train)

# Make predictions using the testing set
diabetes_y_pred = regr.predict(diabetes_X_test)

# The coefficients
print("Coefficients: \n", regr.coef_)
# The mean squared error
print("Mean squared error: %.2f" % mean_squared_error(diabetes_y_test, diabetes_y_pred))
# The coefficient of determination: 1 is perfect prediction
print("Coefficient of determination: %.2f" % r2_score(diabetes_y_test, diabetes_y_pred))

# Plot outputs
plt.scatter(diabetes_X_test, diabetes_y_test, color="black")
plt.plot(diabetes_X_test, diabetes_y_pred, color="blue", linewidth=3)

plt.xticks(())
plt.yticks(())

plt.show()





# create a numpy ndarray object
#-----------------------------------------------------------------------------#
import numpy as np

arr = np.array([1, 2, 3, 4, 5])

print(arr)

print(type(arr))




# Plotly
#-----------------------------------------------------------------------------#
pip install plotly==5.8.2

import plotly.express as px
fig = px.bar(x=["a", "b", "c"], y=[1, 3, 2])
fig.write_html('first_figure.html', auto_open=True)




# Pandas
#------------------------------------------------------------------------------#
import pandas as pd

df = pd.read_csv('data.csv')

print(df.to_string()) 





