library(dplyr)
library(ggplot2)

plays = read.csv(file = paste(getwd(),"/data/plays.csv",sep=''), header = TRUE)
players = read.csv(file = paste(getwd(),"/data/players.csv",sep=''), header = TRUE)
tracking = readRDS(paste0(getwd(),"/data/sample_play.rds"))
pff = read.csv(paste0(getwd(),"/data/PFFScoutingData.csv"))

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

plays %>%
  select(kickReturnYardage,ret,specialTeamsPlayType) %>%
  ggplot(aes(y=possessionTeam,x=kickReturnYardage,fill=specialTeamsPlayType))+
  geom_bar(stat="identity")

pff %>% ggplot(aes(x=hangTime,y=..count..))+
  geom_histogram(fill="blue")

table(pff$kickDirectionIntended,pff$kickDirectionActual)

plays <- plays %>%
  left_join(pff %>% select(gameId,playId,snapDetail,
                           kickDirectionIntended,kickDirectionActual),
            by=c("gameId","playId"),snapDetail=snapDetail)

c(snapDetail,kickAccuracy=(kickDirectionIntended==kickDirectionActual))

plays %>% group_by(kickerId) %>%
  summarize(correctPunt=sum(snapDetail == "OK", na.rm = TRUE), tot=n()) %>%
  mutate(snapRatio=correctPunt/tot) %>%
  arrange(desc(snapRatio)) %>%
  left_join(players %>% select(kickerId=nflId,displayName),by=c("kickerId")) %>%
  slice(1:10) %>%
  ggplot(aes(y=displayName,x=snapRatio))+
  geom_bar(stat="identity")


plays %>% group_by(kickerId) %>%
  summarize(kickAccuracy=sum(kickDirectionIntended==kickDirectionActual,na.rm = TRUE), tot=n()) %>%
  mutate(kickAccuracy=kickAccuracy/tot) %>%
  arrange(desc(kickAccuracy)) %>%
  left_join(players %>% select(kickerId=nflId,displayName),by=c("kickerId")) %>%
  slice(1:10) %>%
  ggplot(aes(y=displayName,x=kickAccuracy))+
  geom_bar(stat="identity")

