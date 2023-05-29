install.packages("Lahman")
library(Lahman)
library(dplyr)
library(ggplot2)
library(caret)
install.packages("caret")
library(caret)

teams<-Teams
head(teams)


#Exploraty Data Analysis

teams<-teams %>%
  mutate(runs_game = R/(W+L))

teams_year<-teams %>%
  group_by(yearID)%>%
  summarize(mean_runs=mean(runs_game, na.tm=TRUE))

teams_year%>%
  ggplot(aes(x=yearID, y=mean_runs)) +
  geom_line()+
  geom_point()
  ggtitle('Average MLB Runs by Year')

head(teams_year)

#Predict Wins by Team

df_clean<-teams%>%
  select(name, yearID, W, L, R, H, X2B, X3B, HR, SO, RA)%>%
  filter(yearID>=2010)
head(df_clean)

lm1<-lm(W ~ R + H + HR + RA,
        data = df_clean)
summary(lm1)


preds<-predict(lm1, df_clean)


df_clean$pred<-preds
head(df_clean)
RMSE(df_clean$pred, df_clean$W)


df_clean %>%
  ggplot(aes(pred,W))+
  geom_point()+
  geom_smooth()+
  ggtitle('Predicted Wins versus Actual')
