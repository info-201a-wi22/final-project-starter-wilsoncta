library(knitr)
library(dplyr)
library(tidyr)
library(ggplot2)


global_temp<-read.csv("../data/GlobalTemperatures.csv")

Carbon_levels_data<-read.csv("../data/CarbonLevel.csv")

char_2_site <- function(yearInput) {
  co2_level <- Carbon_levels_data %>%
    filter(Year >= yearInput[1],
           Year <= yearInput[2]) %>%
    group_by(Year) %>%
    select(1, c(4,7)) %>%
    summarise_all(funs(mean), na.rm = TRUE) %>%
    gather(
      key = "Type",
      value = "CO2",
      -Year
    )
  
  if (yearInput[1] == yearInput[2]) {
    p <- ggplot(co2_level, aes(x= Type, y = CO2)) +
      geom_bar(stat = "identity") +
      theme_minimal()
    return(ggplotly(p))
  } else {
    p <- ggplot(co2_level, aes(x = Year, y = CO2)) +
      geom_line(color = "Red") +
      theme_minimal()
    
    return(ggplotly(p))
  }
}

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
  
  
  
  output$chart2 <- renderPlotly({
    char_2_site(input$year)
  })
  
}