setwd("C:\\Users\\phuon\\Documents\\Info201code\\final-project-starter-wilsoncta\\data")

library(dplyr)
library(tidyr)
library(ggplot2)

natural_disasters <- read.csv("NaturalDisaster.csv")

recent_disasters <- natural_disasters %>%
  filter(Disaster.Type != c("Epidemic", "Animal accident", "Insect infestation"))

natural_disasters_chart <- ggplot(recent_disasters, aes(x = Year, fill = Disaster.Type)) + 
      geom_area(stat = "bin", binwidth = 2) + 
      ylab("Natutal disasters count") + 
      theme(legend.key.size = unit(0.2,"cm")) + 
      labs(fill = "Disaster Type") + 
      theme(legend.position = c(0.2,0.5))
natural_disasters_chart  
