library(knitr)
library(dplyr)
library(tidyr)
library(ggplot2)


global_temp<-read.csv("../data/GlobalTemperatures.csv")

Carbon_levels_data<-read.csv("../data/CarbonLevel.csv")

build_chart <- function(radio,plot) {
  
  surface_temperature <- global_temp %>%
    mutate(dt = as.Date(dt, format = "%Y-%m-%d")) %>%
    filter(dt >= as.Date("1958-01-01") & dt < as.Date("2019-01-01")) %>%
    mutate(Year = format(dt, "%Y")) %>%
    group_by(Year) %>%
    summarize(AverageLandTemp = mean(LandAverageTemperature)) %>%
    mutate(Year = as.numeric(Year)) %>% 
    filter(Year>=radio) %>% 
    select(Year,AverageLandTemp)
  
  
  # Plot data
  p <- plot_ly(
    data = surface_temperature,
    x = ~surface_temperature$Year, 
    y = ~surface_temperature$AverageLandTemp, 
    type = plot, 
    mode = "markers"
    
  ) %>%
    layout(
      title = "Trends of Average Land Temperature",                  # plot title
      xaxis = list(title = "Year"), # axis label + format
      yaxis = list(title = " Average Land Temperature (Celcius)")  # axis label + format
    )
  return(p)
}

server<-server <- function(input, output) { 
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit('introduction.Rmd', quiet = TRUE)))
  })
  
  output$chart <- renderPlotly({
    return(build_chart(input$radio,input$plot))
  })
  
  output$markdown2 <- renderUI({
    HTML(markdown::markdownToHTML(knit('Bibliography.Rmd', quiet = TRUE)))
  })
  
  
}