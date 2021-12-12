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


stat="identity",position="dodge"

plays %>% select(playResult,kickLength,specialTeamsPlayType) %>% ggplot(aes(x=playResult,y=kickLength,color=specialTeamsPlayType))+geom_point()



