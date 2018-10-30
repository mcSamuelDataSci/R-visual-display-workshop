shinyUI(fluidPage(

sidebarPanel( 
  selectInput("myevent", "Disease:",choices = eventL),
  sliderInput("myyear", "Year",value=2001,min=2001,max=2014,animate=TRUE,ticks=FALSE,sep="") ),           

mainPanel(
    plotOutput("map1",width = "100%")  )

))
