library(shiny)
library(plotly)

page_two <- tabPanel("Chart 2",
  sidebarLayout(
    sidebarPanel(
      sliderInput("year", label = "Year",sep = "", min = 1975, max = 2017, value =  c(1975, 2017))
    ),
    mainPanel(
      plotlyOutput("chart2"),
      
      p("This chart is used to show the change in average yearly CO2 level around the world.
        It is clearly shown in the chart that the average CO2 concentration in the air has been steadily
        rising since the 1975 to the latest year in the dataset which is 2020.")
    )
  )
)

page_one <- tabPanel(
  "Project Report", 
  titlePanel("Page 1"), # show with a displayed title
  # This content uses a sidebar layout
  
  sidebarLayout(
    sidebarPanel(
      h3(strong("Project Title -Catastrophic Effects of Climate Change")),
      h3(strong("Author- 
                Green Team: Christine Hau, Wilson Ta, Phuong Lai,Aarav Dewangan")),
      h3(strong("Affiliation- 
      INFO-201: Technical Foundations of Informatics - 
                  The Information School - University of Washington.")),
      h3(strong("Date:- 3/6/2022"))
    ),  

  mainPanel(
    uiOutput("markdown")
   )
  )
 )

chart_sidebar_content <- sidebarPanel(
 
  radioButtons("radio", label = h3("Year"),
               choices =  c("2012","2011","2010","2009","2008","2007","2006") ,
               selected = "2012"
  ),
  
  
  
  
  checkboxGroupInput("plot", label = h3("Type of Plot"), 
                     choices = c("bar","scatter"),
                     selected = "bar")
  
)




chart_main_content <- mainPanel(
  plotlyOutput("chart"),
  
  p("
We have used scatter plot and bar bargraph with a fitting line to depict how average 
land temperature has varied from 2006 to 2015. 
Specefically the x-axis is depicting the years and the y-axis 
is depicting the average land temperature (in Celsius). 
 Climate change has led to a massive increase in average land temperature 
over the years which is not at all good for the inhabitants of the planet earth.  ")
)

chart_panel <- tabPanel(
  "Chart 1",
  
  # Add a titlePanel to your tab
  titlePanel("Chart 1"),
  
  # Create a sidebar layout for this tab (page)
  sidebarLayout(
    
    # Display your `scatter_sidebar_content`
    chart_sidebar_content,
    
    # Display your `scatter_main_content`
    chart_main_content
  )
)

page_three<-tabPanel(
  ("Chart 3"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId="Year",
                  label="Year Range:",
                  min=min(natural_disasters$Year),
                  max=max(natural_disasters$Year),
                  value= c(min(natural_disasters$year),max(natural_disasters$Year)),
                  sep=""
      ),
      selectInput(
        inputId="Country",
        label= "Country:",
        choices= unique(natural_disasters$Country),
        selected= "Indonesia"
      )
    ),
    mainPanel(
      h3(textOutput("caption"),
         position="right",
         width=8,
         plotlyOutput(outputId = "plotted")
      ),
      tags$div(class = "header"),
      h5("This chart attempts to display the different types of natural disasters from the last century and more recent years. The different types of disasters are indicated by the different colors. The widgets allow for the user to adjust what natural disasters occurred during a range of years and a specific country they'd like to see.")
    )
  )
)

last_page <- tabPanel(
  "Bibliography", 
  titlePanel("Bibliography"),
  mainPanel(
    uiOutput("markdown2")
  )
)
  
summary <- tabPanel(
  "Summary", 
  titlePanel("Summary"), # show with a displayed title
  # This content uses a sidebar layout
  
  mainPanel(
    uiOutput("markdown3")
  )
)

ui <- navbarPage(
  "Catastrophic Effects of Climate Change",
  page_one,
  summary,
  chart_panel,
  page_two,
  page_three,
  last_page
)

