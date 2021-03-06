#' Plot List By Playtype
#'
#' @param playtype Special teams play type
#'
#' @return A list with plots available.
make_plot_list <- function(playtype = "Punt") {
  out <- list()
  if (playtype == "Punt") {
    out[[1]] <- "Kick Length" # plot_kick_playType
    out[[2]] <- "Kick Outcome vs Kick Length" # plot_kick_result
    out[[3]] <- "Yards Gained vs Kick Outcome" # plot_results
    out[[4]] <- "Yards Gained vs Kick Length" # plot_kick_playResult
    out[[5]] <- "Return Yards By Opponent Teams" # plot_team_yardage
    out[[6]] <- "Kick Hang Time" # plot_hangTime
    out[[7]] <- "Correct Snaps (Top 10)" # plot_top_punters
    out[[8]] <- "Accurate Kicks (Top 10)" # plot_top_kickers
  }

  if (playtype == "Field Goal") {
    out[[1]] <- "Kick Length" # plot_kick_playType
    out[[2]] <- "Kick Outcome vs Kick Length" # plot_kick_result
    out[[3]] <- "Kick Length By Down" # plot_down_kick
  }

  if (playtype == "Kickoff") {
    out[[1]] <- "Kick Length" # plot_kick_playType
    out[[2]] <- "Kick Outcome vs Kick Length" # plot_kick_result
    out[[3]] <- "Yards Gained vs Kick Outcome" # plot_results
    out[[4]] <- "Yards Gained vs Kick Length" # plot_kick_playResult
    out[[5]] <- "Return Yards By Opponent Teams" # plot_team_yardage
    out[[6]] <- "Kick Hang Time" # plot_hangTime
    out[[7]] <- "Accurate Kicks (Top 10)" # plot_top_kickers
  }

  if (playtype == "Extra Point") {
    out[[1]] <- "Distribution"
    out[[2]] <- "Successful"
    out[[3]] <- "Unsuccessful"
  }

  return(out)

}
