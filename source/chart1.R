setwd("C:\\Users\\phuon\\Documents\\Info201code\\final-project-starter-wilsoncta\\data")

library(dplyr)
library(tidyr)
library(ggplot2)

carbon_level<-read.csv("CarbonLevel.csv")

global_temperature<-read.csv("GlobalTemperatures.csv")

carbon_by_year <- carbon_level %>%
  group_by(Year) %>%
  summarise(average_co2_level = mean(Carbon.Dioxide..ppm., na.rm = TRUE))


  
carbon_chart <- ggplot(carbon_by_year, aes(x = Year, y = average_co2_level)) +  geom_line(size = 1, color = "blue") + ylab("Average CO2 levels (ppm)") + coord_cartesian(ylim = c(300,420)) + scale_x_continuous(breaks = seq(1958, 2017, 6))
carbon_chart

  