library(dplyr)
library(tidyr)
library(ggplot2)

setwd("~/Desktop/info201codes/final-project-starter-wilsoncta/data")
carbon_level<-read.csv("CarbonLevel.csv")
global_temperatures<-read.csv("GlobalTemperatures.csv")
natural_disaster<-read.csv("NaturalDisaster.csv")

summary_info <- list()
summary_info$max_land__avg_temperature<- global_temperatures %>% 
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  filter(LandMaxTemperature==max(LandMaxTemperature))%>%
  pull(LandMaxTemperature)

summary_info$min_land__avg_temperature<- global_temperatures %>% 
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  filter(LandMaxTemperature==min(LandMaxTemperature))%>%
  pull(LandMaxTemperature)

summary_info$max_land_ocean_temperature<-global_temperatures %>% 
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  filter(LandAndOceanAverageTemperature==max(LandAndOceanAverageTemperature))%>%
  pull(LandAndOceanAverageTemperature)

summary_info$min_land_ocean_temperature<-global_temperatures %>% 
  filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
  filter(LandAndOceanAverageTemperature==min(LandAndOceanAverageTemperature))%>%
  pull(LandAndOceanAverageTemperature)

summary_info$mean_affected_since_1958<-natural_disaster %>% 
  filter(Year>="1958") %>% 
  select(No.Affected) %>% 
  summarise(mean_affected=mean(No.Affected,na.rm=TRUE)) %>% 
  pull(mean_affected)

summary_info$max_co2_level<-carbon_level%>% 
  filter(Carbon.Dioxide..ppm.==max(Carbon.Dioxide..ppm.,na.rm=TRUE)) %>% 
  pull(Carbon.Dioxide..ppm.)

summary_info$min_co2_level<-carbon_level%>% 
  filter(Carbon.Dioxide..ppm.==min(Carbon.Dioxide..ppm.,na.rm=TRUE)) %>% 
  pull(Carbon.Dioxide..ppm.)

summary_info$mean_death_since_1958<-natural_disaster %>% 
  filter(Year>="1958") %>% 
  select(Total.Deaths) %>% 
  summarise(mean_deaths=mean(Total.Deaths,na.rm=TRUE)) %>% 
  pull(mean_deaths)




