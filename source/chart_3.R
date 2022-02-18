library(dplyr)
library(tidyr)
library(ggplot2)

source("../source/R Script aggregate.R")

year_graph <- ggplot(agre4, aes(x= Year, y = Seasonally.Adjusted.CO2.Fit..ppm.)) +
  geom_col() +
  coord_cartesian(ylim = c(300,450)) +
  ylab("Peak carbon level (ppm)") +
  labs(title = "Max carbon level by year")
  
year_graph



