library(readr)

PFFScoutingData <- read_csv("data-raw/PFFScoutingData.csv")

usethis::use_data(PFFScoutingData)
