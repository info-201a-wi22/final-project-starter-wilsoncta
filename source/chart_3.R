library(dplyr)
library(tidyr)
library(ggplot2)

carbon_level <- read.csv("../data/CarbonLevel.csv")

carbon_year <- carbon_level %>%
  group_by(Year) %>% 
  summarize(Avg_carbon = mean(Seasonally.Adjusted.CO2..ppm., na.rm = TRUE))

year_graph <- ggplot(carbon_year, aes(x= Year, y= Avg_carbon)) +
  geom_col() 
year_graph



