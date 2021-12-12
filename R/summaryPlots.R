#' Title
#'
#' @param df
#' @param playType
#'
#' @return
#' @export
#'
#' @examples
#' https://r-pkgs.org/man.html#man-functions
getPlot_kick_result=function(df,playType){
  df %>% filter(specialTeamsPlayType==playType) %>%
    select(specialTeamsResult,kickLength) %>%
    ggplot(aes(x=kickLength,y=specialTeamsResult,fill=specialTeamsResult))+
    geom_boxplot(alpha=0.5)+theme(legend.position = "none")
}
