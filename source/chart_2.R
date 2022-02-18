library(dplyr)
library(tidyr)
library(ggplot2)

source("/R Script aggregate.R")

surface_temp_chart <- ggplot(surface_temperature, aes(x = Year, y = AverageLandTemp)) + 
      geom_point() + 
      geom_smooth(method = 'loess', formula = 'y ~ x') + 
      scale_x_continuous(breaks = seq(1958, 2017, 6)) + 
      ylab("Average Land Temperature (celsius)") +
      labs(title = "Average land temperature from 1958-2015")

surface_temp_chart
