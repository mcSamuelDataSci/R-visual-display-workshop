shinyServer(function(input, output) {
  
  output$myPlot1 <-  renderPlot( myPlotFunction(input$myLHJ),  height = 800, width = 600)
  
  })
  


