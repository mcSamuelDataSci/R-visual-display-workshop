#-----------------------------------------------------------------------------
# R Code for GIS and Shiny Learning                                           |
# created: 11/2015                                                            |
# Last Modified: 10/2017                                                      |
# Michael C. Samuel                                                           |
#-----------------------------------------------------------------------------

library(classInt)
library(shiny)
library(maptools)
library(RColorBrewer)

#-- Read Data ------------------------------------------------------------------------------


myPlace <- getwd()

iData           <- read.table(paste0(myPlace,"/CID-dat.csv"),sep=",",na.strings="",header=T,as.is=TRUE)
shape           <- readShapePoly(paste0(myPlace,"/shapeFiles/CaliforniaCounty"))

#-- Construct Vectors needed for perameter inputs  -----------------------------------------

eventL    <- as.vector(sort(unique(iData$Disease)))                           
yearL     <- 2001:2014                                                          

#--  Mapping function ----------------------------------------------------------------------

myMapFunction <- function(myevent="Gonorrhea",myyear=2014){
  
   ratedat <- iData[iData$Disease == myevent,                       "Rate"]
   od.dat  <- iData[iData$Disease == myevent & iData$Year == myyear,      ]
   map.dat <- merge(shape,od.dat, by.x="NAME",by.y="County")

   colors1 <- rev(brewer.pal(7, "RdBu"))
    
   ratedat0 <- ratedat[ratedat !=0]
   breaks   <- classIntervals(ratedat0, n=6, style="quantile")
   breaks0  <- round(breaks$brks,1-trunc(log10(median(ratedat0))))
   breaks1  <- c(0,breaks0)
      
   plot(map.dat, col=colors1[findInterval(map.dat$Rate, breaks1)], axes=F)
   title(paste(myevent,"Rate by California County",myyear))
   legend(x=-118, y=42, legend=c(0,leglabs(breaks0)), fill=colors1, bty="n", x.intersp = 1, y.intersp = 1)
 
 }
