library(knitr)


server<-server <- function(input, output) { 
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit('introduction.Rmd', quiet = TRUE)))
  })
}