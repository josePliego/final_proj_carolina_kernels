library(readr)

PLAYERS <- read_csv("data-raw/players.csv")

usethis::use_data(PLAYERS, overwrite = TRUE)
