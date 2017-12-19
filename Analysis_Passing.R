
library(dplyr)
library(ggplot2)
load("nfldata.rda")



nfl_data <- tbl_df(pbp_data)

## Team Names
team_symbols <- nfl_data %>% 
  select(posteam) %>% 
  unique() %>%
  filter(posteam !="") %>%
  as.matrix() %>%
  sort()

# Step 0: Understand the data
# Play by play of every single game from 2009 - 2016
## write.csv(data.frame(colnames(nfl_data)),"ColNames.csv")



## Why are the Patriots so Good and Browns so Bad?
## What makes a good team?
## A. The offense get alot of Yards, while defense prohibits yards
## B. Offense does not produce turn overs, denfse causes turn overs
## C. Offense scores alot, Defense stops scores



##----------------
## A. The offense get alot of Yards, while defense prohibits yards
# Part 1: Offenseive Yards per Play (W & W/O Penalties)
# Part 2: Defensive Yards per Play
##----------------


# Only 2009, all teams,offense, Yards, Passing, Average, with Penalties (WP)

years <- 2009:2015
numYears <- length(years)
allyearsPassing_WP <- vector()

for(i in 1:numYears){
  oneyearsPassing_WP <- nfl_data %>% filter( Season == years[i] & 
                                               PlayType=="Pass") %>%
    select(posteam,Yards.Gained) %>%
    group_by(posteam) %>%
    summarise(avgPassYard = mean(Yards.Gained)) 
  oneyearsPassing_WP = filter(oneyearsPassing_WP,posteam!="") ## make sure 
  tmp <- oneyearsPassing_WP[,2]
  colnames(tmp) <- paste(colnames(tmp),"_",years[i],sep = "")
  allyearsPassing_WP <- cbind(allyearsPassing_WP,as.matrix(tmp))
  cat("Number of Rows: ",nrow(tmp),"\n")
}


allyearsPassing_WP <- data.frame(Teams = team_symbols,allyearsPassing_WP)

for(i in 1:numYears){
  c_year <- as.character(years[i])
  mini_data <- allyearsPassing_WP %>% select(Teams,contains(c_year))
  colnames(mini_data) <- c("Team","avg_pass")
  
  g <- ggplot(mini_data, aes(x=reorder(Teams, -avg_pass),
                             y=avg_pass))
  g + geom_col()
}
## Who gets the most yards per game