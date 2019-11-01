temp <- filter(prework,yearG3 > "2000-2000",Ndeaths > 100,Level=="lev2") %>% rename(cRate = cDeathRate) %>% select(-SMRcrude,-SMR,-mean.age,-Level,-YLL.adj.rate,-CAUSE) 
