#' Kick Length Distribution Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL play types Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing histogram of `kickLength`
#' @export
#' @importFrom rlang .data
getPlot_kick_playType <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::select(.data$specialTeamsPlayType, kickLength) %>%
    tidyr::drop_na() %>%
    ggplot2::ggplot(ggplot2::aes(x = .data$kickLength, y = ..density..)) +
    ggplot2::geom_histogram(fill = "antiquewhite", binwidth = 2) +
    ggplot2::labs(title = "KICK LENGTH DISTRIBUTION", y = "", x = "Yards") +
    theme_carKer()

  return(fig)

}



#' Kick Length Distribution By Play Result Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing `specialTeamsResult` vs. `kickLength`
#'   comparison
#' @export
#'
getPlot_kick_result <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::select(.data$specialTeamsResult, .data$kickLength) %>%
    tidyr::drop_na() %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = .data$kickLength,
        y = reorder(.data$specialTeamsResult, .data$kickLength)
        )
      ) +
    ggplot2::geom_boxplot(fill = "antiquewhite") +
    ggplot2::labs(
      x = "Yards", y = "", title = "KICK LENGTH DISTRIBUTION BY PLAY RESULT"
      ) +
    theme_carKer() +
    ggplot2::theme(
      legend.position = "none"
      )

  return(fig)

}



#' Title
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or Punt.
#'
#' @return A ggplot figure containing specialTeamsResult v/s playResult comparison
#' @export
#'
getPlot_results <- function(df, playType) {
  fig <- df %>%
    filter(specialTeamsPlayType == playType) %>%
    select(playResult, specialTeamsResult) %>%
    ggplot(aes(x = playResult, y = specialTeamsResult, fill = specialTeamsResult)) +
    geom_boxplot(alpha = 0.5) +
    theme(legend.position = "none")
  return(fig)
}


#' Title
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or Punt.
#'
#' @return A ggplot figure containing kick length v/s playResult comparison
#' @export
#'
getPlot_kick_playResult <- function(df, playType) {
  fig <- df %>%
    filter(specialTeamsPlayType == playType) %>%
    select(playResult, kickLength) %>%
    ggplot(aes(x = playResult, y = kickLength)) +
    geom_point(alpha = 0.5, color = "blue")
  return(fig)
}



#' Title
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or Punt.
#'
#' @return A ggplot figure containing kick length v/s down comparison
#' @export
#'
getPlot_down_kick <- function(df, playType) {
  fig <- df %>%
    filter(specialTeamsPlayType == playType) %>%
    select(down, kickLength) %>%
    ggplot(aes(x = factor(down), y = kickLength, fill = factor(down))) +
    geom_boxplot(position = "dodge", alpha = 0.5) +
    theme(legend.position = "none") +
    labs(x = "down")
  return(fig)
}



#' Title
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or Punt.
#'
#' @return A ggplot figure containing kickReturnYardage v/s possessionTeam comparison
#' @export
#'
getPlot_team_yardage <- function(df, playType) {
  fig <- df %>%
    filter(specialTeamsPlayType == playType) %>%
    group_by(possessionTeam) %>%
    summarize(kickReturnYardage = median(kickReturnYardage, na.rm = TRUE)) %>%
    arrange(desc(kickReturnYardage)) %>%
    ggplot(aes(y = reorder(possessionTeam, kickReturnYardage), x = kickReturnYardage)) +
    geom_bar(stat = "identity", fill = "blue") +
    labs(y = "Possession Team")
  return(fig)
}



#' Title
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or Punt.
#'
#' @return A ggplot figure containing histogram of hangTime
#' @export
#'
getPlot_hangTime <- function(df, playType) {
  fig <- df %>%
    filter(specialTeamsPlayType == playType) %>%
    ggplot(aes(x = hangTime, y = ..density..)) +
    geom_histogram(fill = "blue")
  return(fig)
}



#' Title
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or Punt.
#'
#' @return A ggplot figure containing top Punter players
#' @export
#'
getPlot_topPunters <- function(df, playType) {
  fig <- df %>%
    filter(specialTeamsPlayType == playType) %>%
    group_by(kickerId) %>%
    summarize(correctPunt = sum(snapDetail == "OK", na.rm = TRUE), tot = n()) %>%
    arrange(desc(correctPunt)) %>%
    left_join(PLAYERS %>% select(kickerId = nflId, displayName), by = c("kickerId")) %>%
    slice(1:10) %>%
    ggplot(aes(y = reorder(displayName, correctPunt), x = correctPunt)) +
    geom_bar(stat = "identity", fill = "blue") +
    labs(y = "Player")
  return(fig)
}



#' Title
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or Punt.
#'
#' @return A ggplot figure containing top players with accurate kicks
#' @export
#'
getPlot_topKickers <- function(df, playType) {
  fig <- df %>%
    filter(specialTeamsPlayType == playType) %>%
    group_by(kickerId) %>%
    summarize(kickAccuracy = sum(kickDirectionIntended == kickDirectionActual, na.rm = TRUE), tot = n()) %>%
    arrange(desc(kickAccuracy)) %>%
    left_join(PLAYERS %>% select(kickerId = nflId, displayName), by = c("kickerId")) %>%
    slice(1:10) %>%
    ggplot(aes(y = reorder(displayName, kickAccuracy), x = kickAccuracy)) +
    geom_bar(stat = "identity", fill = "blue") +
    labs(x = "Accurate Kicks", y = "Player")
  return(fig)
}
