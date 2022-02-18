setwd("C:\\Users\\phuon\\Documents\\Info201code\\final-project-starter-wilsoncta\\data")

library(dplyr)
library(tidyr)
library(ggplot2)

surface_temperature <- global_temperature %>%
  mutate(dt = as.Date(dt, format = "%Y-%m-%d")) %>%
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  mutate(Year = format(dt, "%Y")) %>%
  group_by(Year) %>%
  summarize(AverageLandTemp = mean(LandAverageTemperature)) %>%
  mutate(Year = as.numeric(Year))

surface_temp_chart <- ggplot(surface_temperature, aes(x = Year, y = AverageLandTemp)) + geom_point(fill = "red", color ="red") + geom_smooth() + scale_x_continuous(breaks = seq(1958, 2017, 6)) + ylab("Average Land Temperature (celsius)")

surface_temp_chart
