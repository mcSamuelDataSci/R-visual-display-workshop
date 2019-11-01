shinyServer(function(input, output) {
  
  output$myPlot1 <-  renderPlot( deathTrendPlot(input$myCounty))
  
  })
  


