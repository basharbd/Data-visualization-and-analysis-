
install.packages("ggplot2")


library(ggplot2)

# import data
url <- "https://bit.ly/3bsMwsS"
Salaries <- read.csv(url)

# review data
str(Salaries)
summary(Salaries)


# stacked bar plot
ggplot(data=Salaries, aes(x=rank, fill=sex)) + 
  geom_bar()
