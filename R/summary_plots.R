#' Kick Length Distribution Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL play types Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing histogram of `kickLength`
#' @export
#' @importFrom rlang .data
plot_kick_playType <- function(df, playType) {

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
plot_kick_result <- function(df, playType) {

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
    ggplot2::theme(legend.position = "none")

  return(fig)

}

#' Yards Gained By Play Result Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing specialTeamsResult vs playResult
#'   comparison
#' @export
#'
plot_results <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::select(.data$playResult, .data$specialTeamsResult) %>%
    tidyr::drop_na() %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = .data$playResult,
        y = reorder(.data$specialTeamsResult, .data$playResult)
        )
      ) +
    ggplot2::geom_boxplot(fill = "antiquewhite") +
    ggplot2::labs(
      x = "Yards",
      y = "",
      title = "YARDS GAINED BY THE KICKING TEAM BY PLAY RESULT"
    ) +
    theme_carKer() +
    ggplot2::theme(legend.position = "none")

  return(fig)

}

#' Yards Gained vs Kick Length Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing kick length vs playResult comparison
#' @export
#'
plot_kick_playResult <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::select(.data$playResult, .data$kickLength) %>%
    tidyr::drop_na() %>%
    ggplot2::ggplot(ggplot2::aes(x = .data$playResult, y = .data$kickLength)) +
    ggplot2::geom_point(alpha = 0.5, color = "antiquewhite") +
    ggplot2::labs(
      x = "Yards Gained",
      y = "Kick Length",
      title = "KICK LENGTH VS YARDS GAINED BY KICKING TEAM"
      ) +
    theme_carKer()

  return(fig)

}

#' Kick Length By Down Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing kick length vs down comparison
#' @export
#'
plot_down_kick <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::select(.data$down, .data$kickLength) %>%
    tidyr::drop_na() %>%
    ggplot2::ggplot(
      ggplot2::aes(x = factor(.data$down), y = .data$kickLength)
      ) +
    ggplot2::geom_boxplot(position = "dodge", fill = "antiquewhite") +
    ggplot2::labs(x = "Down", y = "Yards", title = "KICK LENGTH BY DOWN") +
    theme_carKer() +
    ggplot2::theme(legend.position = "none")

  return(fig)

}

#' Return Yards By Opponent Teams Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing kickReturnYardage vs possessionTeam
#'   comparison
#' @export
#'
plot_team_yardage <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(specialTeamsPlayType == playType) %>%
    dplyr::group_by(possessionTeam) %>%
    dplyr::summarise(
      kickReturnYardage = median(kickReturnYardage, na.rm = TRUE)
      ) %>%
    dplyr::arrange(dplyr::desc(kickReturnYardage)) %>%
    tidyr::drop_na() %>%
    ggplot2::ggplot(
      ggplot2::aes(
        y = reorder(possessionTeam, kickReturnYardage),
        x = kickReturnYardage)
      ) +
    ggplot2::geom_bar(stat = "identity", fill = "antiquewhite") +
    ggplot2::labs(
      y = "", x = "Yards", title = "MEDIAN KICK RETURN YARDS BY OPPONENT TEAMS"
      ) +
    ggplot2::scale_x_continuous(expand = c(0, 0.1)) +
    theme_carKer()

  return(fig)

}

#' Hang Time Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing histogram of hangTime
#' @export
#'
plot_hangTime <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::select(.data$hangTime) %>%
    tidyr::drop_na() %>%
    ggplot2::ggplot(ggplot2::aes(x = .data$hangTime, y = ..density..)) +
    ggplot2::geom_histogram(fill = "antiquewhite", binwidth = 0.1) +
    ggplot2::labs(
      x = "Seconds", y = "", title = "KICK HANG TIME DISTRIBUTION"
      ) +
    theme_carKer()

  return(fig)

}

#' Correct Snaps By Punter Plot
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing top Punter players
#' @export
#'
plot_top_punters <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::group_by(.data$kickerId) %>%
    dplyr::summarise(
      correctPunt = sum(.data$snapDetail == "OK", na.rm = TRUE),
      tot = dplyr::n()
      ) %>%
    dplyr::arrange(dplyr::desc(.data$correctPunt)) %>%
    dplyr::left_join(
      PLAYERS %>%
        dplyr::select(kickerId = .data$nflId, .data$displayName),
      by = c("kickerId")
      ) %>%
    dplyr::slice(1:10) %>%
    ggplot2::ggplot(
      ggplot2::aes(
        y = reorder(.data$displayName, .data$correctPunt),
        x = .data$correctPunt)
      ) +
    ggplot2::geom_bar(stat = "identity", fill = "antiquewhite") +
    ggplot2::labs(
      y = "",
      x = "Correct Snaps",
      title = "NUMBER OF CORRECT SNAPS BY PUNTER"
      ) +
    ggplot2::scale_x_continuous(expand = c(0, 1)) +
    theme_carKer()

  return(fig)

}

#' Accurate Kicks By Kicker Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param playType One of the NFL playtypes Extra Point, Field Goal, Kickoff or
#'   Punt.
#'
#' @return A ggplot figure containing top players with accurate kicks
#' @export
#'
plot_top_kickers <- function(df, playType) {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == playType) %>%
    dplyr::group_by(.data$kickerId) %>%
    dplyr::summarise(
      kickAccuracy = sum(
        .data$kickDirectionIntended == .data$kickDirectionActual, na.rm = TRUE
        ),
      tot = dplyr::n()
      ) %>%
    dplyr::arrange(dplyr::desc(.data$kickAccuracy)) %>%
    dplyr::left_join(
      PLAYERS %>%
        dplyr::select(kickerId = .data$nflId, .data$displayName),
      by = c("kickerId")
      ) %>%
    dplyr::slice(1:10) %>%
    ggplot2::ggplot(
      ggplot2::aes(
        y = reorder(.data$displayName, .data$kickAccuracy),
        x = .data$kickAccuracy
        )
      ) +
    ggplot2::geom_bar(stat = "identity", fill = "antiquewhite") +
    ggplot2::labs(
      x = "Accurate Kicks",
      y = "",
      title = "NUMBER OF ACCURATE KICKS BY KICKER"
      ) +
    ggplot2::scale_x_continuous(expand = c(0, 1)) +
    theme_carKer()

  return(fig)

}

#' Extra Points Plots
#'
#' @param df A dataframe containing information on NFL plays
#' @param plot_type Plot one of Distribution, Successful or Unsuccesful
#'
#' @return A ggplot figure containing extra point plots
#' @export
#'
plot_extra_point <- function(df, plot_type = "Distribution") {

  fig <- df %>%
    dplyr::filter(.data$specialTeamsPlayType == "Extra Point")

  if (plot_type == "Distribution") {
    fig <- fig %>%
      dplyr::select(.data$specialTeamsResult) %>%
      tidyr::drop_na() %>%
      dplyr::count(.data$specialTeamsResult) %>%
      dplyr::mutate(across(n, ~.x/sum(.x))) %>%
      ggplot2::ggplot(
        ggplot2::aes(
          x = reorder(.data$specialTeamsResult, -.data$n),
          y = .data$n
          )
      ) +
      ggplot2::geom_col(fill = "antiquewhite") +
      ggplot2::labs(
        y = "", x = "", title = "EXTRA POINT SUCCESS DISTRIBUTION"
        ) +
      ggplot2::scale_y_continuous(labels = scales::label_percent()) +
      theme_carKer()
  }

  if (plot_type == "Successful") {
    fig <- fig %>%
      dplyr::group_by(.data$kickerId) %>%
      dplyr::summarise(
        accuracy = sum(
          .data$specialTeamsResult == "Kick Attempt Good", na.rm = TRUE
        ),
        tot = dplyr::n()
      ) %>%
      dplyr::arrange(dplyr::desc(.data$accuracy)) %>%
      dplyr::left_join(
        PLAYERS %>%
          dplyr::select(kickerId = .data$nflId, .data$displayName),
        by = c("kickerId")
      ) %>%
      dplyr::slice(1:10) %>%
      ggplot2::ggplot(
        ggplot2::aes(
          y = reorder(.data$displayName, .data$accuracy),
          x = .data$accuracy
        )
      ) +
      ggplot2::geom_bar(stat = "identity", fill = "antiquewhite") +
      ggplot2::labs(
        x = "Accurate Kicks",
        y = "",
        title = "NUMBER OF ACCURATE KICKS BY KICKER"
      ) +
      ggplot2::scale_x_continuous(expand = c(0, 1)) +
      theme_carKer()
  }

  if (plot_type == "Unsuccessful") {
    fig <- fig %>%
      dplyr::group_by(.data$kickerId) %>%
      dplyr::summarise(
        accuracy = sum(
          .data$specialTeamsResult == "Kick Attempt No Good", na.rm = TRUE
        ),
        tot = dplyr::n()
      ) %>%
      dplyr::arrange(dplyr::desc(.data$accuracy)) %>%
      dplyr::left_join(
        PLAYERS %>%
          dplyr::select(kickerId = .data$nflId, .data$displayName),
        by = c("kickerId")
      ) %>%
      dplyr::slice(1:10) %>%
      ggplot2::ggplot(
        ggplot2::aes(
          y = reorder(.data$displayName, .data$accuracy),
          x = .data$accuracy
        )
      ) +
      ggplot2::geom_bar(stat = "identity", fill = "antiquewhite") +
      ggplot2::labs(
        x = "Inaccurate Kicks",
        y = "",
        title = "NUMBER OF INACCURATE KICKS BY KICKER"
      ) +
      ggplot2::scale_x_continuous(expand = c(0, .1)) +
      theme_carKer()
  }

  return(fig)

}
