usSTD               <- gsheet2tbl('https://drive.google.com/open?id=1VYCK3y0lwkv2fUF2teoB6IWpjuB6tjiI-JMDaYqgiuo')
names(usSTD)[15:23] <- c("sy","sym","syf","ct","ctm","ctf","gc","gcm","gcf")

ca.gc       <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1bUdG5B_QasP0hqBuGL-utsZkD-36SonczBmjSqVR0FE/edit?usp=sharing')
names.short <- c("AI/AN","A/PI","Black","Latino","White")

gc.trend       <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1o5h5aRtVVnCqK6SStxxxSQjAAgKEYBdnKMOxqJZ2c9c/edit?usp=sharing')

sfmhs       <- gsheet2tbl('https://drive.google.com/open?id=1FAH0sfmW69uo_Hyji_wt88GIftTpVDz8ylwPCsanPw8')

CA.gc.race      <- gsheet2tbl('https://drive.google.com/open?id=1SZmzPqsRjjjtmUZWLkXFKYJEgUhCkxbIUG8DaN75RfA')
region.2 <- as.character(CA.gc.race$region.2)