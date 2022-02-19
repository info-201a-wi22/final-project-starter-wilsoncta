library(dplyr)
library(tidyr)
library(ggplot2)

Carbon_levels_data<-read.csv("../data/CarbonLevel.csv")
agre4<-Carbon_levels_data%>%
  group_by(Year)%>%
  filter(Seasonally.Adjusted.CO2.Fit..ppm.==max(Seasonally.Adjusted.CO2.Fit..ppm., na.rm= TRUE))%>%
  select(Year,Seasonally.Adjusted.CO2.Fit..ppm.)

year_graph <- ggplot(agre4, aes(x= Year, y = Seasonally.Adjusted.CO2.Fit..ppm.)) +
  geom_col() +
  coord_cartesian(ylim = c(300,450)) +
  ylab("Peak carbon level (ppm)") +
  labs(title = "Max carbon level by year")
  
year_graph



