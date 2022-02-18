setwd("c:/Users/ohhay/OneDrive/Documents/INFO201/final-project-starter-wilsoncta/data")

library(dplyr)
library(tidyr)
library(ggplot2)

carbon_level <- read.csv("CarbonLevel.csv")

carbon_year <- group_by(carbon_level, Year) %>% 
  summarize(Avg_carbon = mean(Carbon.Dioxide..ppm., na.rm = TRUE)) %>% 
  tail(n = 10)
View(carbon_year)

year_graph <- ggplot(carbon_year, aes(x= Year, y= Avg_carbon)) + 
  geom_bar(stat = "identity")
year_graph

