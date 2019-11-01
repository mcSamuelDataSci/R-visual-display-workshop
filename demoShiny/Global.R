# ------------------------------------------
# Author
# Date
# Other useful information
#-------------------------------------------


# --- LOAD LIBRARIES -----------------------

library(shiny)
library(dplyr)
library(fs)
library(readr)
library(ggplot2)


# --- SET PATHS AND READ DATA --------------

place      <- getwd()
deathWork  <- read_csv(path(place,"myData/deathsCA.csv"))


# --- SHINY CONSTANTS AND LISTS ------------

countyList  <- as.vector(unique(deathWork$county))


# --- FUNCTIONS ----------------------------

deathTrendPlot <- function(myCounty = "Alameda"){
  
  plotDat <- filter(deathWork, county == myCounty, causeName == "Kidney diseases") 
  
  ggplot(data=plotDat, 
         aes(x=yearG3, y=aRate, group=sex, color=sex)) +
         geom_line(size=2)                             +
         labs(title = paste0("Death Rate (age-adjusted) from Kidney Disease in ",myCounty)) +
         theme(plot.title=element_text(size=20,color="blue"))
  
}  


# -------------------------------------------