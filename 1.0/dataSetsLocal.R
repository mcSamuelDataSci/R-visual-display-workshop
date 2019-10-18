# ----------------------------------------------------------------------------------
# usSTD
# Data set of chlamydia, gonorrhea, and syphilis cases, rates, and population, for total, males, and females for each of the fifty US states and Washington, D.C. 
#23 variables; 51 records
# Read in US STD data
usSTD   <- read.table(paste0(myPlace,"/RawData/ctgcps2002.csv"),sep=",",na.strings="",header=T)
# Add some easier to use labels for convenience
names(usSTD)[15:23] <- c("sy","sym","syf","ct","ctm","ctf","gc","gcm","gcf")

# ----------------------------------------------------------------------------------
# ca.gc
# 11 variables; 5 observations
# Data set (really a summary data table) of 2002 California gonorrhea by race/ethnicity and gender.  Includes case counts, rates, percents, and population denominators 
# Identical to public data at: http://www.dhs.ca.gov/ps/dcdc/STD/stddatasummaries_2002.htm
# Read in CA Gonorrhea Race data
ca.gc  <- read.table(paste0(myPlace,"/RawData/GC_2002_race.csv"),sep=",",na.strings="",header=T)
# Vector of short names for convenience
names.short <- c("AI/AN","A/PI","Black","Latino","White")

# ----------------------------------------------------------------------------------
# gc.trend
# Data set of overall California gonorrhea rates from 1913 to 2003 and United States gonorrhea rates from 1941 to 2002
# 3 variables; 90 records
# Read in CA and US gonorrhea trend data
gc.trend  <- read.table(paste0(myPlace,"/RawData/GC_trend.csv"),sep=",",na.strings="",header=T)

# ----------------------------------------------------------------------------------
# sfmhs
# 9 variables; 1044 records
# Data set of selected keys variables (e.g. HIV status, sexual "orientation", CD4 count) from the San Francisco Men's Health Study, one of the original natural history studies of HIV, begun in 1984 in the Castro district of San Francisco
sfmhs  <- read.table(paste0(myPlace,"/RawData/sfmhs1.csv"),sep=",",na.strings="",header=T)

# ----------------------------------------------------------------------------------
# sp.mmwr
# Data from Oct 3, 2003 MMWR, showing (lack of) fatal cardiac adverse events associated with 1947 massive smallpox vaccination in New York 
# 2 variables; 122 records
sp.mmwr <- read.table(paste0(myPlace,"/RawData/smallpox.mmwr.csv"),sep=",",na.strings="",header=T)

# ----------------------------------------------------------------------------------
# CA.gc.race
# Data set of 2002 gonorrhea rates and counts by gender and total, for each of California's 61 local health jurisdictions
# 44 variables; 62 records
# Read in CA GC race LHJ data
CA.gc.race  <- read.table(paste0(myPlace,"/RawData/GC_2002.HJ-Race-Sex.csv"),sep=",",na.strings="",header=T,as.is=TRUE)
region.2 <- as.character(CA.gc.race$region.2)

