library(readr)
library(dplyr)

TRACKING <- read_csv("data-raw/tracking2020.csv") %>%
  select(-unique_id)

usethis::use_data(TRACKING, overwrite = TRUE)


# Run this code in the tracking2020.csv file in the kaggle competition:
# https://www.kaggle.com/c/nfl-big-data-bowl-2022/data?select=tracking2020.csv

# dt_tracking %>%
#   mutate(
#     unique_id = paste(gameId, playId, sep = "_")
#   ) %>%
#   filter(
#     unique_id %in% c(
#       "2020092006_3960",
#       "2020091000_612",
#       "2020091300_1229",
#       "2020092705_3011",
#       "2020092711_229",
#       "2020091000_2659",
#       "2020091000_1039",
#       "2020091307_121",
#       "2020091300_2898",
#       "2020091300_1333",
#       "2020091000_3435",
#       "2020091307_504",
#       "2020110804_3603",
#       "2020091300_4711",
#       "2020091310_3509",
#       "2020091400_2960",
#       "2020091000_1524",
#       "2020091000_39",
#       "2020091310_1503",
#       "2020111501_1451",
#       "2020091000_1961",
#       "2020091301_1853",
#       "2020121700_3552"
#     )
#   ) %>%
#   write_csv("data-raw/tracking2020.csv")
