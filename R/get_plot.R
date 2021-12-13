#' Get User Plot
#'
#' @param df NFL data frame
#' @param playType Special Teams play type
#' @param plot Type of plot to get
#'
#' @return A ggplot object containing the user requested plot
get_plot <- function(df, playType, plot) {

  plt <- ggplot2::ggplot()

  if (plot == "Kick Length") plt <- plot_kick_playType(df, playType)
  if (plot == "Kick Outcome vs Kick Length") plt <- plot_kick_result(df, playType)
  if (plot == "Yards Gained vs Kick Outcome") plt <- plot_results(df, playType)
  if (plot == "Yards Gained vs Kick Length") plt <- plot_kick_playResult(df, playType)
  if (plot == "Return Yards By Opponent Teams") plt <- plot_team_yardage(df, playType)
  if (plot == "Kick Hang Time") plt <- plot_hangTime(df, playType)
  if (plot == "Correct Snaps (Top 10)") plt <- plot_top_punters(df, playType)
  if (plot == "Accurate Kicks (Top 10)") plt <- plot_top_kickers(df, playType)
  if (plot == "Kick Length By Down") plt <- plot_down_kick(df, playType)
  if (plot == "Kick Length By Down") plt <- plot_down_kick(df, playType)
  if (plot == "Distribution") plt <- plot_extra_point(df, "Distribution")
  if (plot == "Successful") plt <- plot_extra_point(df, "Successful")
  if (plot == "Unsuccessful") plt <- plot_extra_point(df, "Unsuccessful")

  return(plt)

}
