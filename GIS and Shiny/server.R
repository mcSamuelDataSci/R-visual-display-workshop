shinyServer(function(input, output) {
  output$map1   <-  renderPlot(myMapFunction(input$myevent,input$myyear), height = 800, width = 600)
  })
  
