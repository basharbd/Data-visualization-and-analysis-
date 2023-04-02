# Filename: R_121_Vattenfall_v1.R
# jaas, June 2022.
#
##############################################################################
# Objective: 
#  Analysis of main component failure event on wind turbines in 
#  a selection of wind parks onshore/offshore.
#
# Table of Contents.
# #1.0: Help start, save pointer to graphic I/O parameters set.
# #1.1: Install packages.
# #1.2: Read wind turbine dataset into variable wtf.
# #1.3: Transform wtf into a dataframe.
#
##############################################################################
# References:
#
# [Kabacoff, 2020] Robert Kabacoff, "Data Visualization with R", 2020.
#     https://rkabacoff.github.io/datavis/
#
##############################################################################
# 1.0: Enter the main R Language documentation.
#
help.start()          # This is the main entry to the R project documentation.
#
opar.org <- par(no.readonly=TRUE) # Store original graphical parameter setting.
#
##############################################################################
# 1.1: Install packages
#
install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library("ggplot2")

########################################################################
# 1.2: Read excel datasheet.

path <- c("Vattenfall_-_Main_Component_Exchange_Database_v3.xlsx")
wtf <- read_excel(path, sheet = 1)
str(wtf)
summary(wtf)

########################################################################
# #1.3: Transform into dataframe

wtf.df <- data.frame(wtf)
str(wtf.df)

########################################################################



# grouped bar plot
ggplot(data=wtf.df, aes(x=Component.Failed, fill=Park.Type)) + 
  geom_bar(position="dodge")



# grouped bar plot
ggplot(data=wtf.df, aes(x=Component.Failed, fill=Turbine.Platform)) + 
  geom_bar(position="dodge")

# scatter plot
ggplot(data=wtf.df, aes(x=Turbine.Stopp.Date, y=Component.Exchange.Date)) + 
  geom_point()

# strip plot
ggplot(data=wtf.df, aes(x=Turbine.Stopp.Date, y=Component.Failed)) +
  geom_point()

 























