
library(dplyr)
Carbon_levels_data<-read.csv(file="~/Documents/info201code/final-project-starter-wilsoncta/data/CarbonLevel.csv")
View(Carbon_levels_data)

agre1<-Carbon_levels_data%>%
  group_by(Year)%>%
  filter(Carbon.Dioxide..ppm.==max(Carbon.Dioxide..ppm., na.rm= TRUE))%>%
  select(Year,Carbon.Dioxide..ppm.)

agre2<-Carbon_levels_data%>%
  group_by(Year)%>%
  filter(Seasonally.Adjusted.CO2..ppm.==max(Seasonally.Adjusted.CO2..ppm., na.rm= TRUE))%>%
  select(Year,Seasonally.Adjusted.CO2..ppm.)
View(agre2)

table<-full_join(agre1,agre2)
View(table)

global_temp<-read.csv(file="~/Documents/info201code/final-project-starter-wilsoncta/data/GlobalTemperatures.csv")
View(global_temp)

average_land_temperature <- global_temp %>%
  mutate(dt = as.Date(dt, format = "%Y-%m-%d")) %>%
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  mutate(Year = format(dt, "%Y")) %>%
  group_by(Year) %>%
  summarize(AverageLandTemp = mean(LandAverageTemperature)) %>%
  mutate(Year = as.numeric(Year))

land_and_ocean_temperature <- global_temp %>%
  mutate(dt = as.Date(dt, format = "%Y-%m-%d")) %>%
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  mutate(Year = format(dt, "%Y")) %>%
  group_by(Year) %>%
  summarize(LandOceanAvg = mean(LandAndOceanAverageTemperature)) %>%
  mutate(Year = as.numeric(Year))

aggregate_table<-full_join(table,average_land_temperature)
aggregate_table_final<-full_join(aggregate_table,land_and_ocean_temperature)
View(aggregate_table_final)



