# server.R

library(shiny)
library(ggplot2)
scale_colour_brewer(palette="Set1")
load("SGIdata.rda")

function(input, output) {
  

  
  output$plot <- renderPlot({
    
    p <- ggplot(SGI, aes_string(x=input$x, y=input$y)) + geom_point()
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)

      
    print(p)
    
  }, height=500)
  
}
