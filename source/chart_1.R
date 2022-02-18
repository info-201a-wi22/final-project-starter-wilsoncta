library(dplyr)
library(tidyr)
library(ggplot2)

natural_disasters <- read.csv("../data/NaturalDisaster.csv")

recent_disasters <- natural_disasters %>%
  filter(Disaster.Type != c("Epidemic", "Animal accident", "Insect infestation"))

natural_disasters_chart <- ggplot(recent_disasters, aes(x = Year, fill = Disaster.Type)) + 
      geom_area(stat = "bin", binwidth = 2) + 
      ylab("Natutal disasters count") + 
      theme(legend.key.size = unit(0.2,"cm")) + 
      labs(fill = "Disaster Type", title = "Natural disasters from 1900s to 2000s") + 
      theme(legend.position = c(0.2,0.5))
natural_disasters_chart  
