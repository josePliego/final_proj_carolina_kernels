library(dplyr)
library(ggplot2)

plays = read.csv(file = paste(getwd(),"/data/plays.csv",sep=''), header = TRUE)
players = read.csv(file = paste(getwd(),"/data/players.csv",sep=''), header = TRUE)
tracking = readRDS(paste0(getwd(),"/data/sample_play.rds"))

plays %>%
  select(specialTeamsPlayType,kickLength) %>%
  ggplot(aes(x=kickLength,y=..count..,
             fill=specialTeamsPlayType)) +
  geom_density(alpha=0.2)

plays %>% select(specialTeamsResult,kickLength) %>%
  ggplot(aes(x=kickLength,y=specialTeamsResult,fill=specialTeamsResult))+
  geom_boxplot(alpha=0.5)

plays %>% select(playResult,specialTeamsResult) %>%
  ggplot(aes(x=playResult,y=specialTeamsResult,fill=specialTeamsResult))+
  geom_boxplot(alpha=0.5)

plays %>%
  select(playResult,kickLength,specialTeamsPlayType) %>%
  ggplot(aes(x=playResult,y=kickLength,
             color=specialTeamsPlayType))+
  geom_point()

plays %>%
  select(down,specialTeamsPlayType) %>%
  ggplot(aes(x=down,y=..count..,fill=specialTeamsPlayType))+
  geom_bar(position="dodge")

plays %>%
  select(down,kickLength) %>%
  ggplot(aes(x=factor(down),y=kickLength,fill=factor(down)))+
  geom_boxplot(position="dodge",alpha=0.5)

plays %>%
  select(kickReturnYardage,possessionTeam,specialTeamsPlayType) %>%
  ggplot(aes(y=possessionTeam,x=kickReturnYardage,fill=specialTeamsPlayType))+
  geom_bar(stat="identity")





