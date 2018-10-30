shinyUI(fluidPage(
  
  titlePanel("Preterm Birth Plot"),
  
  sidebarPanel(
    selectInput("myLHJ", "Location:",choices = lList )),
  
  mainPanel(plotOutput("myPlot1"))
  ))


