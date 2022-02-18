
library(dplyr)
Carbon_levels_data<-read.csv("../data/CarbonLevel.csv")
View(Carbon_levels_data)

gre1<-Carbon_levels_data%>%
  group_by(Year)%>%
  filter(Carbon.Dioxide..ppm. == max(Carbon.Dioxide..ppm., na.rm= TRUE)) %>%
  select(Year,Carbon.Dioxide..ppm.)

agre2<-Carbon_levels_data%>%
  group_by(Year)%>%
  filter(Seasonally.Adjusted.CO2..ppm.==max(Seasonally.Adjusted.CO2..ppm., na.rm= TRUE))%>%
  select(Year,Seasonally.Adjusted.CO2..ppm.)
View(agre2)

table<-full_join(agre1,agre2)

agre3<-Carbon_levels_data%>%
  group_by(Year)%>%
  filter(Carbon.Dioxide.Fit..ppm.==max(Carbon.Dioxide.Fit..ppm., na.rm= TRUE))%>%
  select(Year,Carbon.Dioxide.Fit..ppm.)
View (agre3)

agre4<-Carbon_levels_data%>%
  group_by(Year)%>%
  filter(Seasonally.Adjusted.CO2.Fit..ppm.==max(Seasonally.Adjusted.CO2.Fit..ppm., na.rm= TRUE))%>%
  select(Year,Seasonally.Adjusted.CO2.Fit..ppm.)

table1<-full_join(agre3,agre4)

final_table<-full_join(table,table1)

global_temp<-read.csv("../data/GlobalTemperatures.csv")


surface_temperature <- global_temp %>%
  mutate(dt = as.Date(dt, format = "%Y-%m-%d")) %>%
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  mutate(Year = format(dt, "%Y")) %>%
  group_by(Year) %>%
  summarize(AverageLandTemp = mean(LandAverageTemperature)) %>%
  mutate(Year = as.numeric(Year))

aggregate_table<-full_join(final_table,surface_temperature)
