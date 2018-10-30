library(epitools)
#library(sqldf)

library(readxl)
library(fs)
library(dplyr)
library(readr)
library(ggplot2)


gbdMap0    <- as.data.frame(read_excel( path("gbd.ICD.Map.xlsx"), sheet="main"))  
causeList36       <- gbdMap0[!is.na(gbdMap0$causeList),c("LABEL","causeList","nameOnly")] %>% arrange(LABEL)
causeNum36        <- causeList36[,"LABEL"]
names(causeNum36) <- causeList36[,"causeList" ]

junk <- read_csv("ageGroupCauseDeath.csv",col_types = "cncccnnnn")


tDat <- tDat[(tDat$sex== "Total" & tData$CAUSE)]


tDat <- as.data.frame(read_csv("ageGroupCauseDeath.csv",col_types = "cncccnnnn")) %>%
           filter(sex != "Total",CAUSE != "0") %>%
           mutate(Drate=100000*Ndeaths/pop,
                  ageG=ifelse(ageG != "5 - 14",ageG,"0 5-14"))


glimpse(tDat)

cList <- c("A","B","C","D","E")


tDat1 <- filter(tDat,county=="California",year==2017,CAUSE %in% cList)
tDat2 <- filter(tDat,county=="California",year==2017,CAUSE %in% cList)


ggplot( tDat2, aes( x = ageG, y = Drate ))+
                    geom_bar( stat = "identity" ) + 
  facet_grid(rows = vars(CAUSE), cols = vars(sex) )





myAgePlot <- function(myCause="0") {

ggplot( tDat, aes( x = ageG, y = Drate ) ) + 
  geom_bar( stat = "identity" ) + 
  facet_wrap( ~ sex,ncol=1 )  

}



myAgePlot(cList[3])


for (i in 1:6) {
myAgePlot(cList[i])
}




# -- SEPERATE CODE - POPULATION PYRAMID WORK -----------------------------------------------



popGH$Population <- ifelse(popGH$Gender == "Male", -1*popGH$Population, popGH$Population)



pyramidGH <- ggplot(popGHcens, aes(x = Age, y = Population, fill = Gender)) + 
  geom_bar(data = subset(popGHcens, Gender == "Female"), stat = "identity") + 
  geom_bar(data = subset(popGHcens, Gender == "Male"), stat = "identity") + 
  scale_y_continuous(labels = paste0(as.character(c(seq(2, 0, -1), seq(1, 2, 1))), "m")) + 
  coord_flip()
pyramidGH




popStandard         <- ageMap %>% mutate(ageG = paste0(lAge," - ",uAge))


# n1 <- ggplot(tDat, aes(x = ageG, y = pop, fill = sex)) + 
#   geom_bar(data = subset(tdat, sex == "Female"), stat = "identity") + 
#   geom_bar(data = subset(tdat, sex == "Male"), stat = "identity") + 
#   coord_flip() + 
#   scale_fill_brewer(palette = "Set1") + 
#   theme_bw()




