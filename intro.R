# ggplot2 is in the tidyverse suite of packages
library(tidyverse)
data("economics")
# ?economics  # uncomment and run to read about dataset
econ <- ggplot(economics, aes(x = date, y = pop))
econ + geom_line # diff geometries
econ + geom_point

# aes, or aesthetics
## data-driven variables go inside aes
ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point(aes(colour = factor(cyl), size = gear))

## outside aes
ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point(colour = "violet", size = 3) # inherits aes from ggplot

# choroplethr and choroplethrMaps
library(choroplethr)
library(choroplethrMaps)
data("df_state_demographics")
## what happens if we try to plot directly?
state_choropleth(df_state_demographics)
## set 'value' column to be the column of interest, then plot again
df_state_demographics$value = df_state_demographics$median_age
state_choropleth(df_state_demographics,  # default parameters, title/legend
                 title = "US 2013 - 2017 State Median Age",
                 legend = "Median Age (years)")
## continuous scale and zoom
state_choropleth(df_state_demographics,
                 title = "US 2013 - 2017 State Median Age",
                 legend = "Median Age (years)",
                 num_colors = 1,
                 zoom  = c("pennsylvania", "new jersey", 
                           "delaware", "maryland"))

