library(shiny)
library(ggplot2)


fluidPage(
  
  titlePanel("Social Indicators explorer"),
  
  sidebarPanel(
    
    
    selectInput('x', 'Select X', choices = names(SGI[,c(1, 2, 3, 4, 5, 6, 7, 8)]), selected = SGI[,8] ),
    selectInput('y', 'Select Y', choices = names(SGI[,c(1, 2, 3, 4, 5, 6, 7, 8)])),
    selectInput('color', 'Select Color',choices =  names(SGI[,c(1,2,8,9)]),
    )

  ),
  
  mainPanel(
    plotOutput('plot')
  )
)