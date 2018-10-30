library(shiny)
library(dplyr)
library(fs)

# setwd("f:/0 R Samuel")
place <- getwd()

prework <- read.csv(path(place,"myData/prework.csv"),as.is=TRUE)

lList   <- as.vector(unique(prework$county))

myPlotFunction <- function(LHJ="Shasta"){
  preplot <- filter(prework,county==LHJ)
  plot(preplot$year,preplot$rate,type="l",ylim=c(0,max(preplot$rate)),main=LHJ,lwd=3,col="blue",
       cex.axis=2,cex.main=2)  }

