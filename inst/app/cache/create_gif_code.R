library(carolinaKernels)
library(ggplot2)
library(gganimate)
library(gifski)
library(tidyverse)
library(dplyr)
library(cowplot)
library(ggridges)
library(repr)
library(here)

plays <- PLAYS
tracking <- TRACKING

# spits out an animation gif
create_animation <- function(play_df, gif_filename) {
  anim <- play_df %>%
    # ggplot() + geom_point(aes(x = x, y = y, color = team)) + theme(legend.position = "none") +
    ggplot() +
    theme(legend.position = "none", panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank(), axis.text.y = element_blank(), axis.ticks.y = element_blank(), panel.background = element_rect(fill = "#c2efff")) +
    xlim(0, 120) +
    ylim(0, 53.33) +

    ## NFL Field Specific Lines
    # add yard lines every 10 yds
    annotate("segment", x = seq(20, 105, by = 10), y = 0, xend = seq(20, 105, by = 10), yend = 53.33, col = "black") +

    # set mid-field and endzone lines
    annotate("segment", x = c(60), y = 0, xend = c(60), yend = 53.33, lwd = 1.3, col = "white") +
    annotate("segment", x = c(0, 10, 110, 120), y = 0, xend = c(0, 10, 110, 120), yend = 53.33, lwd = 1.1, col = "black") +

    # add lines at locations of hash marks
    annotate("segment", x = 10, y = (29.24667 + 30.24667) / 2, xend = 110, yend = (29.24667 + 30.24667) / 2, color = "white", lwd = 1.05) +
    annotate("segment", x = 10, y = (24.08333 + 23.08333) / 2, xend = 110, yend = (24.08333 + 23.08333) / 2, color = "white", lwd = 1.05) +

    # sideline
    annotate("segment", x = 0, y = c(0, 53.33), xend = 120, yend = c(0, 53.33), lwd = 1.3, col = "black") +
    # denote 50yd, 30yd, 10yd line with text
    annotate("text", label = 50, x = 60, y = 10, colour = "black", size = 5) +
    annotate("text", label = 30, x = 80, y = 6, colour = "black", size = 5) +
    annotate("text", label = 10, x = 100, y = 2, colour = "black", size = 5) +
    annotate("text", label = 30, x = 40, y = 6, colour = "black", size = 5) +
    annotate("text", label = 10, x = 20, y = 2, colour = "black", size = 5) +
    # above labels
    annotate("text", label = 50, x = 60, y = 44, colour = "black", size = 5) +
    annotate("text", label = 30, x = 80, y = 48, colour = "black", size = 5) +
    annotate("text", label = 10, x = 100, y = 51.5, colour = "black", size = 5) +
    annotate("text", label = 30, x = 40, y = 48, colour = "black", size = 5) +
    annotate("text", label = 10, x = 20, y = 51.5, colour = "black", size = 5) +

    # field goal posts
    annotate(geom = "segment", x = 120, xend = 120, y = 160 / 6 + 18.5 / 3 / 2, yend = 160 / 6 - 18.5 / 3 / 2, color = "yellow", lwd = 1.3) +
    annotate(geom = "segment", x = 0, xend = 0, y = 160 / 6 + 18.5 / 3 / 2, yend = 160 / 6 - 18.5 / 3 / 2, color = "yellow", lwd = 1.3) +

    ## add the points last so they sit ontop of the field markings
    scale_color_manual(values = c("#ff1212", "#8f6545", "#057d11")) +
    geom_point(aes(x = x, y = y, color = team, shape = is_football), size = 3) +
    transition_time(frameId) +
    ease_aes("linear") +
    NULL

  nFrames <- max(play_df$frameId)
  anim_save(
    here("inst/app/cache/gifs/", paste0(gif_filename, ".gif")),
    animate(anim,
            width = 720, height = 440,
            fps = 7, nframe = nFrames
    )
  )
}

# Create Gifs
## Extra Point
## extra point - not exciting...select one for each result (kick attempt good, blocked, kick attempt no good)
extra_point_outcomes <- plays %>%
  filter(specialTeamsPlayType == "Extra Point" & gameId > 2020000000) %>%
  group_by(specialTeamsResult) %>%
  slice(n = 1)

# add extra columns for gif processing
extra_point_outcomes$game_play_key <- paste(extra_point_outcomes$gameId, "_", extra_point_outcomes$playId, sep = "")
extra_point_outcomes$gif_name <- str_replace_all(paste(extra_point_outcomes$specialTeamsPlayType, "_", extra_point_outcomes$specialTeamsResult, sep = ""), fixed(" "), "")

# grab the location data for the specified plays
extra_point <- extra_point_outcomes %>% inner_join(tracking, by = c("gameId", "playId"))
extra_point <- extra_point %>%
  mutate(is_football = case_when(displayName == "football" ~ TRUE, TRUE ~ FALSE))

# end data augmentation

# create gif for each unique game/play key
for (i in unique(extra_point$game_play_key)) {
  play_df <- extra_point %>% filter(game_play_key == i)
  create_animation(play_df, unique(play_df$gif_name))
}

## Punt
punt_outcomes <- plays %>%
  filter(specialTeamsPlayType == "Punt" & gameId > 2020000000) %>%
  group_by(specialTeamsResult) %>%
  slice(n = 1)
# add extra columns for gif processing
punt_outcomes$game_play_key <- paste(punt_outcomes$gameId, "_", punt_outcomes$playId, sep = "")
punt_outcomes$gif_name <- str_replace_all(paste(punt_outcomes$specialTeamsPlayType, "_", punt_outcomes$specialTeamsResult, sep = ""), fixed(" "), "")

# grab the location data for the specified plays
punt <- punt_outcomes %>% inner_join(tracking, by = c("gameId", "playId"))
punt <- punt %>%
  mutate(is_football = case_when(displayName == "football" ~ TRUE, TRUE ~ FALSE))

# end data augmentation

# create gif for each unique game/play key
for (i in unique(punt$game_play_key)) {
  play_df <- punt %>% filter(game_play_key == i)
  create_animation(play_df, unique(play_df$gif_name))
}

## Kickoff
kickoff_outcomes <- plays %>%
  filter(specialTeamsPlayType == "Kickoff" & gameId > 2020000000) %>%
  group_by(specialTeamsResult) %>%
  slice(n = 1)
# add extra columns for gif processing
kickoff_outcomes$game_play_key <- paste(kickoff_outcomes$gameId, "_", kickoff_outcomes$playId, sep = "")
kickoff_outcomes$gif_name <- str_replace_all(paste(kickoff_outcomes$specialTeamsPlayType, "_", kickoff_outcomes$specialTeamsResult, sep = ""), fixed(" "), "")

# grab the location data for the specified plays
kickoff <- kickoff_outcomes %>% inner_join(tracking, by = c("gameId", "playId"))
kickoff <- kickoff %>%
  mutate(is_football = case_when(displayName == "football" ~ TRUE, TRUE ~ FALSE))

# end data augmentation

# create gif for each unique game/play key
for (i in unique(kickoff$game_play_key)) {
  play_df <- kickoff %>% filter(game_play_key == i)
  create_animation(play_df, unique(play_df$gif_name))
}

## Field Goal
field_goal_outcomes <- plays %>%
  filter(specialTeamsPlayType == "Field Goal" & gameId > 2020000000) %>%
  group_by(specialTeamsResult) %>%
  slice(n = 1)
# add extra columns for gif processing
field_goal_outcomes$game_play_key <- paste(field_goal_outcomes$gameId, "_", field_goal_outcomes$playId, sep = "")
field_goal_outcomes$gif_name <- str_replace_all(paste(field_goal_outcomes$specialTeamsPlayType, "_", field_goal_outcomes$specialTeamsResult, sep = ""), fixed(" "), "")

# grab the location data for the specified plays
field_goal <- field_goal_outcomes %>% inner_join(tracking, by = c("gameId", "playId"))
field_goal <- field_goal %>%
  mutate(is_football = case_when(displayName == "football" ~ TRUE, TRUE ~ FALSE))

# end data augmentation

# create gif for each unique game/play key
for (i in unique(field_goal$game_play_key)) {
  play_df <- field_goal %>% filter(game_play_key == i)
  create_animation(play_df, unique(play_df$gif_name))
}
