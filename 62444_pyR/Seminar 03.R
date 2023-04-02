
#Categorical vs. Categorical
# -----------------------------------------------------------------------------

library(ggplot2)
data(mpg, package="ggplot2")
# stacked bar chart
ggplot(mpg, 
       aes(x = class, 
           fill = drv)) + 
  geom_bar(position = "stack")







# grouped bar plot
library(ggplot2)
ggplot(mpg, 
       aes(x = class, 
           fill = drv)) + 
  geom_bar(position = "dodge")






# grouped bar plot preserving zero count bars
library(ggplot2)
ggplot(mpg, 
       aes(x = class, 
           fill = drv)) + 
  geom_bar(position = position_dodge(preserve = "single"))








# bar plot, with each bar representing 100%, 
# reordered bars, and better labels and colors
library(ggplot2)
library(scales)
ggplot(mpg, 
       aes(x = factor(class,
                      levels = c("2seater", "subcompact", 
                                 "compact", "midsize", 
                                 "minivan", "suv", "pickup")),
           fill = factor(drv, 
                         levels = c("f", "r", "4"),
                         labels = c("front-wheel", 
                                    "rear-wheel", 
                                    "4-wheel")))) + 
  geom_bar(position = "fill") +
  scale_y_continuous(breaks = seq(0, 1, .2), 
                     label = percent) +
  scale_fill_brewer(palette = "Set2") +
  labs(y = "Percent", 
       fill = "Drive Train",
       x = "Class",
       title = "Automobile Drive by Class") +
  theme_minimal()













# Quantitative vs. Quantitative
#-------------------------------------------------------------------------------

# enhanced scatter plot
ggplot(Salaries, 
       aes(x = yrs.since.phd, 
           y = salary)) +
  geom_point(color="cornflowerblue", 
             size = 2, 
             alpha=.8) +
  scale_y_continuous(label = scales::dollar, 
                     limits = c(50000, 250000)) +
  scale_x_continuous(breaks = seq(0, 60, 10), 
                     limits=c(0, 60)) + 
  labs(x = "Years Since PhD",
       y = "",
       title = "Experience vs. Salary",
       subtitle = "9-month salary for 2008-2009")






# scatterplot with linear fit line
ggplot(Salaries,
       aes(x = yrs.since.phd, 
           y = salary)) +
  geom_point(color= "steelblue") +
  geom_smooth(method = "lm")




# scatterplot with quadratic line of best fit
ggplot(Salaries, 
       aes(x = yrs.since.phd, 
           y = salary)) +
  geom_point(color= "steelblue") +
  geom_smooth(method = "lm", 
              formula = y ~ poly(x, 2), 
              color = "indianred3")




data(gapminder, package="gapminder")

# Select US cases
library(dplyr)
plotdata <- filter(gapminder, 
                   country == "United States")

# simple line plot
ggplot(plotdata, 
       aes(x = year, 
           y = lifeExp)) +
  geom_line()



# line plot with points
# and improved labeling
ggplot(plotdata, 
       aes(x = year, 
           y = lifeExp)) +
  geom_line(size = 1.5, 
            color = "lightgrey") +
  geom_point(size = 3, 
             color = "steelblue") +
  labs(y = "Life Expectancy (years)", 
       x = "Year",
       title = "Life expectancy changes over time",
       subtitle = "United States (1952-2007)",
       caption = "Source: http://www.gapminder.org/data/")







# Categorical vs. Quantitative
#-------------------------------------------------------------------------------------

data(Salaries, package="carData")

# calculate mean salary for each rank
library(dplyr)
plotdata <- Salaries %>%
  group_by(rank) %>%
  summarize(mean_salary = mean(salary))



# plot mean salaries
ggplot(plotdata, 
       aes(x = rank, 
           y = mean_salary)) +
  geom_bar(stat = "identity")





# plot mean salaries in a more attractive fashion
library(scales)
ggplot(plotdata, 
       aes(x = factor(rank,
                      labels = c("Assistant\nProfessor",
                                 "Associate\nProfessor",
                                 "Full\nProfessor")), 
           y = mean_salary)) +
  geom_bar(stat = "identity", 
           fill = "cornflowerblue") +
  geom_text(aes(label = dollar(mean_salary)), 
            vjust = -0.25) +
  scale_y_continuous(breaks = seq(0, 130000, 20000), 
                     label = dollar) +
  labs(title = "Mean Salary by Rank", 
       subtitle = "9-month academic salary for 2008-2009",
       x = "",
       y = "")




# plot the distribution of salaries 
# by rank using kernel density plots
ggplot(Salaries, 
       aes(x = salary, 
           fill = rank)) +
  geom_density(alpha = 0.4) +
  labs(title = "Salary distribution by rank")



# plot the distribution of salaries by rank using boxplots
ggplot(Salaries, 
       aes(x = rank, 
           y = salary)) +
  geom_boxplot() +
  labs(title = "Salary distribution by rank")







# create ridgeline graph
library(ggplot2)
library(ggridges)

ggplot(mpg, 
       aes(x = cty, 
           y = class, 
           fill = class)) +
  geom_density_ridges() + 
  theme_ridges() +
  labs("Highway mileage by auto class") +
  theme(legend.position = "none")







# plot the distribution of salaries 
# by rank using jittering
library(scales)
ggplot(Salaries, 
       aes(x = factor(rank,
                      labels = c("Assistant\nProfessor",
                                 "Associate\nProfessor",
                                 "Full\nProfessor")), 
           y = salary, 
           color = rank)) +
  geom_boxplot(size=1,
               outlier.shape = 1,
               outlier.color = "black",
               outlier.size  = 3) +
  geom_jitter(alpha = 0.5, 
              width=.2) + 
  scale_y_continuous(label = dollar) +
  labs(title = "Academic Salary by Rank", 
       subtitle = "9-month salary for 2008-2009",
       x = "",
       y = "") +
  theme_minimal() +
  theme(legend.position = "none") +
  coord_flip()










# The plot3d function plots points within an RGL window
# ------------------------------------------------------------------------------

# Install development version from Github
remotes::install_github("dmurdoch/rgl")

install.packages("rgl")

install.packages("rgl", repos = "https://dmurdoch.github.io/drat",
                 type = "binary")

library(rgl)

with(iris, plot3d(Sepal.Length, Sepal.Width, Petal.Length, 
                  type="s", col=as.numeric(Species)))
