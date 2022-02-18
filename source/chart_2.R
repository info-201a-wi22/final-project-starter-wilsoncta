library(dplyr)
library(tidyr)
library(ggplot2)

global_temperature <- read.csv("../data/GlobalTemperatures.csv")

surface_temperature <- global_temperature %>%
  mutate(dt = as.Date(dt, format = "%Y-%m-%d")) %>%
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  mutate(Year = format(dt, "%Y")) %>%
  group_by(Year) %>%
  summarize(AverageLandTemp = mean(LandAverageTemperature)) %>%
  mutate(Year = as.numeric(Year))

surface_temp_chart <- ggplot(surface_temperature, aes(x = Year, y = AverageLandTemp)) + 
      geom_point() + 
      geom_smooth(method = 'loess', formula = 'y ~ x') + 
      scale_x_continuous(breaks = seq(1958, 2017, 6)) + 
      ylab("Average Land Temperature (celsius)") +
      labs(title = "Average land temperature from 1958-2015")

surface_temp_chart
