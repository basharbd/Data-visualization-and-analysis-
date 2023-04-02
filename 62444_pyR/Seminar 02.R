install.packages("igraph") 
install.packages("network") 
install.packages("sna")
install.packages("visNetwork")
install.packages("threejs")
install.packages("networkD3")
install.packages("ndtv")
install.packages("ggradar")
install.packages("scales")
install.packages("dplyr")
install.packages("quanteda")

#  An example using for loop in R to count the
#number of even numbers in a vector.
x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)



# Using if-else-statement in R
x <- -5
if(x > 0){
  print("Non-negative number")
} else {
  print("Negative number")
}



# Using while loop in R to calculate factorial of
#a number
n <- 5

factorial <- 1
i <- 1

while (i <= n)
{
  factorial = factorial * i
  i = i + 1
}
print(factorial)



# Graph Visualization
plot(x=1:10, y=rep(5,10), pch=19, cex=3, col="dark red")
points(x=1:10, y=rep(6, 10), pch=19, cex=3, col="557799")
points(x=1:10, y=rep(4, 10), pch=19, cex=3, col=rgb(.25, .5, .3))


# Network layouts
library(igraph)
net.bg <- sample_pa(100) 
V(net.bg)$size <- 8
V(net.bg)$frame.color <- "white"
V(net.bg)$color <- "orange"
V(net.bg)$label <- "" 
E(net.bg)$arrow.mode <- 0
plot(net.bg)



# Categorical Data _ Bar Charts
library(ggplot2)
data(Marriage, package = "mosaicData")
# plot the distribution of race
ggplot(Marriage, aes(x = race)) +
  geom_bar()



# create a basic ggplot2 pie chart
plotdata <- Marriage %>%
  count(race) %>%
  arrange(desc(race)) %>%
  mutate(prop = round(n * 100 / sum(n), 1),
         lab.ypos = cumsum(prop) - 0.5  *prop)

ggplot(plotdata, 
       aes(x = "", 
           y = prop, 
           fill = race)) +
  geom_bar(width = 1, 
           stat = "identity", 
           color = "black") +
  coord_polar("y", 
              start = 0, 
              direction = -1) +
  theme_void()





# boxplots
library(ggplot2)
ggplot(data=Salaries, aes(x=rank, y=salary)) + 
  geom_boxplot()




#Time series
library(ggplot2)
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  labs(title = "Personal Savings Rate",
       x = "Date",
       y = "Personal Savings Rate")





# scatter plot with line of best fit
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) + 
  geom_point() + 
  geom_smooth(method="lm", formula=y~x)



#Text Analysis and Visualization
require(quanteda)
tokenInfo <- summary(data_corpus_inaugural)
## Corpus consisting of 58 documents.
## 
##             Text Types Tokens Sentences Year  President       FirstName
##  1789-Washington   626   1540        23 1789 Washington          George
##  1793-Washington    96    147         4 1793 Washington          George
##       1797-Adams   826   2584        37 1797      Adams            John
##   1801-Jefferson   716   1935        41 1801  Jefferson          Thomas
##   1805-Jefferson   804   2381        45 1805  Jefferson          Thomas
##     1809-Madison   536   1267        21 1809    Madison           James
##     1813-Madison   542   1304        33 1813    Madison           James
##      1817-Monroe  1040   3696       121 1817     Monroe           James
##      1821-Monroe  1262   4898       129 1821     Monroe           James
##       1825-Adams  1004   3154        74 1825      Adams     John Quincy
##     1829-Jackson   517   1210        25 1829    Jackson          Andrew
##     1833-Jackson   499   1271        29 1833    Jackson          Andrew
##    1837-VanBuren  1315   4175        95 1837  Van Buren          Martin
##    1841-Harrison  1893   9178       210 1841   Harrison   William Henry
##        1845-Polk  1330   5211       153 1845       Polk      James Knox
##      1849-Taylor   497   1185        22 1849     Taylor         Zachary
##      1853-Pierce  1166   3657       104 1853     Pierce        Franklin
##    1857-Buchanan   945   3106        89 1857   Buchanan           James
##     1861-Lincoln  1075   4016       135 1861    Lincoln         Abraham
##     1865-Lincoln   362    780        26 1865    Lincoln         Abraham
##       1869-Grant   486   1243        40 1869      Grant      Ulysses S.
##       1873-Grant   552   1479        43 1873      Grant      Ulysses S.
##       1877-Hayes   829   2730        59 1877      Hayes   Rutherford B.
##    1881-Garfield  1018   3240       111 1881   Garfield        James A.
##   1885-Cleveland   674   1828        44 1885  Cleveland          Grover
##    1889-Harrison  1355   4744       157 1889   Harrison        Benjamin
##   1893-Cleveland   823   2135        58 1893  Cleveland          Grover
##    1897-McKinley  1236   4383       130 1897   McKinley         William
##    1901-McKinley   857   2449       100 1901   McKinley         William
##   1905-Roosevelt   404   1089        33 1905  Roosevelt        Theodore
##        1909-Taft  1436   5844       159 1909       Taft  William Howard
##      1913-Wilson   661   1896        68 1913     Wilson         Woodrow
##      1917-Wilson   549   1656        59 1917     Wilson         Woodrow
##     1921-Harding  1172   3743       148 1921    Harding       Warren G.
##    1925-Coolidge  1221   4442       196 1925   Coolidge          Calvin
##      1929-Hoover  1086   3895       158 1929     Hoover         Herbert
##   1933-Roosevelt   744   2064        85 1933  Roosevelt     Franklin D.
##   1937-Roosevelt   729   2027        96 1937  Roosevelt     Franklin D.
##   1941-Roosevelt   527   1552        68 1941  Roosevelt     Franklin D.
##   1945-Roosevelt   276    651        26 1945  Roosevelt     Franklin D.
##      1949-Truman   781   2531       116 1949     Truman        Harry S.
##  1953-Eisenhower   903   2765       119 1953 Eisenhower       Dwight D.
##  1957-Eisenhower   621   1933        92 1957 Eisenhower       Dwight D.
##     1961-Kennedy   566   1568        52 1961    Kennedy         John F.
##     1965-Johnson   569   1725        93 1965    Johnson   Lyndon Baines
##       1969-Nixon   743   2437       103 1969      Nixon Richard Milhous
##       1973-Nixon   545   2018        68 1973      Nixon Richard Milhous
##      1977-Carter   528   1380        52 1977     Carter           Jimmy
##      1981-Reagan   904   2798       128 1981     Reagan          Ronald
##      1985-Reagan   925   2935       123 1985     Reagan          Ronald
##        1989-Bush   795   2683       141 1989       Bush          George
##     1993-Clinton   644   1837        81 1993    Clinton            Bill
##     1997-Clinton   773   2451       111 1997    Clinton            Bill
##        2001-Bush   622   1810        97 2001       Bush       George W.
##        2005-Bush   772   2325       100 2005       Bush       George W.
##       2009-Obama   939   2729       110 2009      Obama          Barack
##       2013-Obama   814   2335        88 2013      Obama          Barack
##       2017-Trump   582   1662        88 2017      Trump       Donald J.
## 
## Source:  /home/paul/Dropbox/code/quanteda/* on x86_64 by paul
## Created: Fri Sep 12 12:41:17 2014
## Notes:
if (require(ggplot2))
  ggplot(data=tokenInfo, aes(x=Year, y=Tokens, group=1)) + geom_line() + geom_point() +
  scale_x_discrete(labels=c(seq(1789,2012,12)), breaks=seq(1789,2012,12) )










#-------------------------------------------------------------------------------#
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




