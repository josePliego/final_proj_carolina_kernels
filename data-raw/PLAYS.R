library(readr)

PLAYS <- read_csv("data-raw/plays.csv")

usethis::use_data(PLAYS)
