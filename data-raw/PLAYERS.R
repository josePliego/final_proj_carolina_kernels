library(readr)

PLAYERS <- read_csv("data-raw/plays.csv")

usethis::use_data(PLAYERS)
