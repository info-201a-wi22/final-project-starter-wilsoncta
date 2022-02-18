setwd("C:\\Users\\phuon\\Documents\\Info201code\\final-project-starter-wilsoncta\\data")

library(dplyr)
library(tidyr)
library(ggplot2)

carbon_level<-read.csv("CarbonLevel.csv")

global_temperature<-read.csv("GlobalTemperatures.csv")

carbon_by_year <- carbon_level %>%
  group_by(Year) %>%
  summarise(average_co2_level = mean(Carbon.Dioxide..ppm., na.rm = TRUE))

surface_temperature <- global_temperature %>%
  mutate(dt = as.Date(dt, format = "%Y-%m-%d")) %>%
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  mutate(Year = format(dt, "%Y")) %>%
  group_by(Year) %>%
  summarize(AverageLandTemp = mean(LandAverageTemperature)) %>%
  mutate(Year = as.numeric(Year))
  
carbon_chart <- ggplot(carbon_by_year, aes(x = Year, y = average_co2_level)) +  geom_line(size = 1, color = "blue") + ylab("Average CO2 levels (ppm)") + coord_cartesian(ylim = c(300,420)) + scale_x_continuous(breaks = seq(1958, 2017, 6))
carbon_chart
surface_temp_chart <- ggplot(surface_temperature, aes(x = Year, y = AverageLandTemp)) + geom_point(fill = "red", color ="red") + geom_smooth() + scale_x_continuous(breaks = seq(1958, 2017, 6))
surface_temp_chart
