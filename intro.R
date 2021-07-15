#### ggplot2 is in tidyverse suite of pkgs ####
library(tidyverse)
# ?economics  # uncomment and run for dataset info
data("economics") # built-in dataset in base R

# assign base layer to object, not required but keeps code cleaner
econ <- ggplot(economics, aes(x = date, y = pop))
econ + geom_line # diff geometries
econ + geom_point

# aes, or aesthetics
# ?mtcars # uncomment, run for dataset info (also built-in base R)
## data-driven variables go inside aes
ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point(aes(colour = factor(cyl), size = gear))
## fixed values go outside aes
ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point(colour = "violet", size = 3) # inherits aes from ggplot

#### choroplethr and choroplethrMaps ####
library(choroplethr)
library(choroplethrMaps)
?df_state_demographics
data("df_state_demographics")
## what happens if we try to plot directly?
state_choropleth(df_state_demographics)
## set 'value' column to be the column of interest, then plot again
# note default parameters
df_state_demographics$value = df_state_demographics$median_age
state_choropleth(df_state_demographics,
                 title = "US 2013 - 2017 State Median Age",
                 legend = "Median Age (years)")

## customize: continuous scale (num_colors), zoom in on vector of states
state_choropleth(df_state_demographics,
                 title = "US 2013 - 2017 State Median Age",
                 legend = "Median Age (years)",
                 num_colors = 1,
                 zoom  = c("pennsylvania", "new jersey", 
                           "delaware", "maryland"))

