#' Carolina Kernels Theme
#'
#' Theme function used in the Carolina Kernels final project.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' p1 <- ggplot2::diamonds %>%
#'     dplyr::slice(1:100) %>%
#'     ggplot(aes(x, y)) +
#'     geom_point()
#'
#' p1 + theme_carKer()
#' }
#' @importFrom ggplot2 `%+replace%`
theme_carKer <- function() {
  ggplot2::theme_dark() %+replace%
    ggplot2::theme(
      axis.line.x.top = ggplot2::element_blank(),
      axis.line.y.right = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = "white", size = 0.1)
    )
}
