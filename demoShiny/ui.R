shinyUI(fluidPage(
  
    titlePanel("Deaths in the Golden State"),
  
    sidebarPanel(
      selectInput("myCounty", "Where?:",choices = countyList )
    ),
    
    mainPanel(plotOutput("myPlot1"))
  
  )
)
            


