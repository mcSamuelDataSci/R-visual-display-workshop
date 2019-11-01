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
library(readxl)
library(ggplot2)

library(sf)
library(tigris)  # Geographies: block_groups, blocks, 
                 #              counties, county_subdivisions, 
                 #              places, pumas, school_districts, 
                 #              states, zctas
  

library(tmap)
# --- SET PATHS AND READ DATA --------------

myPlace     <- getwd()
deathWork   <- read_csv(path(myPlace,"myData/deathsCA.csv"))


# --- READ AND MANIPULATE SHAPE-REALATED FILES --------------

options(tigris_class = "sf")

tractShape  <- tracts(state = "CA", cb = TRUE) 
countyShape <- counties(state = "CA", cb = TRUE) 

# Make "shape file" based on grouping geographies
countyShape <- tractShape %>% group_by(COUNTYFP) %>% summarize() %>% ungroup()

countyLink  <- read_excel(paste0(myPlace,"/myInfo/County Codes to County Names Linkage.xlsx")) %>%
                    select(county=countyName,FIPSCounty) 

countyShape <- left_join(countyShape,countyLink,by=c("COUNTYFP" = "FIPSCounty")) 
dataWork    <- filter(deathWork, yearG3 == "2016-2018", causeName == "Ischaemic heart disease", sex == "Total", county != "CALIFORNIA")
mapWork     <- left_join(countyShape,dataWork,by="county")


# --- MAKE MAPS WITH TMAP() ----------------------------------


tm_shape(mapWork) + tm_polygons(col="aRate")



