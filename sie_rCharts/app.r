require(shiny)
require(rCharts)

SGI <- readRDS("~/data/SGI.rds")

server<-function(input,output){
  
  output$str <- renderPrint({
    str(SGI)
  })
  

  output$myChart<-renderChart({
    p1<-rPlot(input$x,input$y, data=SGI,type="point",color=input$color)
    p1$addParams(dom="myChart")
    return(p1)
  })
}

ui<-pageWithSidebar(
  headerPanel("Social Indicators Explorer"),
  sidebarPanel(
    selectInput(inputId="y",
                label="Select Y Variable",
                choices=names(SGI[,c(1, 2, 3, 4, 5, 6, 7, 8)])
    ),
    selectInput(inputId="x",
                label="Select X Variable",
                choices=names(SGI[,c(1, 2, 3, 4, 5, 6, 7, 8)])
    ),
    selectInput(inputId="color",
                label="Color by Variable",
                choices=names(SGI[,c(1,2,8,9)])
    ),    width = 4
  ),
  mainPanel(
    tabsetPanel(type = "tab",
                tabPanel("Plot", showOutput("myChart","polycharts")),
                tabPanel("Structure", verbatimTextOutput("str"))
      
      ) , width = 6
)
)
shinyApp(ui=ui,server=server)
