library(shiny)
library(plotly)

page_one <- tabPanel(
  "Introduction", 
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


  
ui <- navbarPage(
  "Catastrophic Effects of Climate Change",
  page_one
  
)



