setwd("C:/Users/User/Downloads")
library(dplyr)
library(readxl)
library(stringr)

#Read .csv file
Team<-read.delim(file.choose(), sep = ",", header = TRUE, dec =".")



#filer by only games played and select columns
Team1<-Team%>%
  select('Game'='Gm.', Date, 'Team'=Tm, 'Home_or_Away'='X.1', 
         'Opponent'=Opp, 'Win_or_lose'='W.L', 'Runs'=R, 'Runs_Against'=RA, 
         'Pitcher_Win'=Win, 'Pitcher_Loss'=Loss, 'Pitcher_Save'=Save, 
         'Day_or_Night'='D.N', Attendance)



#Replace empty string with NA
Team1["Home_or_Away"][Team1["Home_or_Away"] == ''] <- NA
print(Team1)



#Replace 'Win_or-lose' column with right values
Team1["Win_or_lose"][Team1["Win_or_lose"] == 'W-wo'] <- 'W'
Team1["Win_or_lose"][Team1["Win_or_lose"] == 'L-wo'] <- 'L'




#Add if statement for day and night games and home and away
Team2<-Team1%>%
  mutate(Day_or_Night = ifelse(Day_or_Night=="D", "Day", "Night"), 
         Home_or_Away=ifelse(is.na(Home_or_Away), "Home", "Away"))



Team3<- Team2%>% group_by(Team, Home_or_Away, Day_or_Night)%>%
                            summarize(Average_Runs=mean(Runs),
                            Average_Runs_Against= mean(Runs_Against),
                            Average_Attendence = mean(Attendance))

