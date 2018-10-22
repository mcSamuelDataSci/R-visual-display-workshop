 myPlace   <- getwd()   

 
 library(dplyr)
 library(readxl)
 library(fs)

 datCounty <- readRDS(path(myPlace,"datCounty.RDS"))

  gbdMap0      <- as.data.frame(read_excel( path(myPlace,"/gbd.ICD.Map.xlsx/"), sheet="main"))    #extra "/" as examples
  causeList36  <- gbdMap0[!is.na(gbdMap0$causeList),c("LABEL","causeList","nameOnly")] %>% arrange(LABEL)
  causeNum36        <- causeList36[,"LABEL"]
  names(causeNum36) <- causeList36[,"causeList" ]

  source(path("myFunctions","wraplabels.R"))
  
  
lList         <- sort(as.character(unique(datCounty$county)))
lListNoState  <- lList[lList != STATE]


#------------------------------------------------------------------------------------------------------------



rankCause  <- function(myLHJ) {
  
  if(1==2){
    myLHJ="Alameda"
    }
  
  dat.1 <- filter(datCounty,county==myLHJ,year==2017,sex=="Total",Level=="lev2",CAUSE !=0)
  dat.1 <- dat.1[order(dat.1$aRate),]
  
  nR    <- nrow(dat.1)
  myNX  <- min(nR,myN) 
  dat.1 <- dat.1[((nR-myNX):nR),]
  
  layout(matrix(c(1,1,2,3,4,5),1,6,byrow=TRUE))
  
  bLwd <- 2
  myCol <- "blue"
  myCex <- 1.2
  
  par(mar=c(5,13,0,0),oma = c(0, 0, 3, 0))
  t.plot <- barplot((dat.1$Ndeaths),xlab="Deaths (n)",col=myCol,horiz=TRUE,space=.3,cex.lab=myCex,xlim=c(0,1.04*max(dat.1$Ndeaths))); 
  box(lwd=bLwd)
  t.label <- causeList36[match(dat.1$CAUSE,causeList36[,"LABEL"]),"nameOnly"]
  wr.lap <- wrap.labels(t.label ,18)
  axis(side=2,at=t.plot,labels=wr.lap,las=2,cex.axis=1.6)
  box(lwd=2)
  
  par(mar=c(5,0,0,0))
  t.plot <- barplot((dat.1$YLLper),xlab="YLL per 100K pop",col=myCol,horiz=TRUE,space=.3,cex.lab=myCex,xlim=c(0,1.04*max(dat.1$YLLper)));box(lwd=bLwd)
  t.plot <- barplot((dat.1$aRate),xlab="Age-Adjusted Rate",col=myCol,horiz=TRUE,space=.3,cex.lab=myCex,xlim=c(0,1.04*max(dat.1$aRate))); box(lwd=bLwd)
  t.plot <- barplot((dat.1$mean.age), xlab="Mean Age",col=myCol,horiz=TRUE,space=.3,cex.lab=myCex,xlim=c(0,1.04*max(dat.1$mean.age)));   box(lwd=bLwd)
  
  t.plot <- barplot((dat.1$SMR),xlab="SMR",                col=myCol,horiz=TRUE,space=.3,cex.lab=myCex,xlim=c(0,1.04*max(dat.1$SMR)));     box(lwd=bLwd)
  abline(v=0.8,col="green"); abline(v=1,col="gray"); abline(v=1.2,col="red")
  text(1,0,"state rate",srt=90,col="black",cex=1.2,adj=c(0,.5))
  
  mtext(paste0("Measures by Cause in ",myYear," in ",myLHJ),outer = TRUE,cex=1.6,line=1,font=2)
  
}




