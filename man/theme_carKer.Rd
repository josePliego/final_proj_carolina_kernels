% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_carKer.R
\name{theme_carKer}
\alias{theme_carKer}
\title{Carolina Kernels Theme}
\usage{
theme_carKer()
}
\description{
Theme function used in the Carolina Kernels final project.
}
\examples{
\dontrun{
p1 <- ggplot2::diamonds \%>\%
    dplyr::slice(1:100) \%>\%
    ggplot(aes(x, y)) +
    geom_point()

p1 + theme_carKer()
}
}
