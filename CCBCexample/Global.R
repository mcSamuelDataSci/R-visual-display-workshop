 myPlace   <- getwd()   
 STATE     <- "CALIFORNIA"
 yearGrp   <- "2013-2017"
 
 library(dplyr)
 library(readxl)

 datCounty <- readRDS(path(myPlace,"/myData/",whichData,"datCounty.RDS"))

  gbdMap0    <- as.data.frame(read_excel( path(myPlace,"myInfo//gbd.ICD.Map.xlsx/"), sheet="main"))    #extra "/" as examples
lMeasures <- c("YLL","YLLper","YLL.adj.rate","Ndeaths","cDeathRate","aRate", "mean.age","SMR")

lMeasuresC <- c("Years of Life Lost (YLL)",
                "YLL per 100,000 population",
                "Age-Adjusted YLL Rate",
                "Number of deaths",
                "Crude Death Rate",
                "Age-Adjusted Death Rate",
                "Mean Age at Death",
                "Standard Mortality Ratio")

names(lMeasures) <- lMeasuresC


causeList36       <- gbdMap0[!is.na(gbdMap0$causeList),c("LABEL","causeList","nameOnly")] %>% arrange(LABEL)
causeNum36        <- causeList36[,"LABEL"]
names(causeNum36) <- causeList36[,"causeList" ]


lList         <- sort(as.character(unique(datCounty$county)))
lListNoState  <- lList[lList != STATE]


nC       <- 5
myColor1 <- rev(brewer.pal(nC,"RdYlBu"))





