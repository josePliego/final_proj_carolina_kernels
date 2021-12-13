# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

usethis::use_package("shinyWidgets")
usethis::use_package("shinyjs")
usethis::use_package("dplyr")
usethis::use_package("ggplot2")
usethis::use_package("rlang")
usethis::use_package("tidyr")
usethis::use_package("scales")
usethis::use_package("stats")
usethis::use_package("bslib")
usethis::use_package("stringr")
usethis::use_package("utils")
usethis::use_package("tidyverse", type = "Suggests")
usethis::use_package("kableExtra", type = "Suggests")

usethis::use_pipe(export = TRUE)

usethis::use_data_raw("PLAYERS")
usethis::use_data_raw("PFFScoutingData")
usethis::use_data_raw("PLAYS")
usethis::use_data_raw("TRACKING")

# Engineering

## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "00_main")
golem::add_module(name = "01_cover")
golem::add_module(name = "02_playtype")
golem::add_module(name = "03_playvis")
golem::add_module(name = "04_plots")

## Add helper functions ----
usethis::use_r("theme_carKer")
usethis::use_r("make_plot_list")
usethis::use_r("get_plot")
usethis::use_r("global")

## External resources
## Creates .css file at inst/app/www
golem::add_css_file("custom")

## Add internal datasets ----
## If you have data in your package
# usethis::use_data_raw(name = "my_dataset", open = FALSE)

## Tests ----
## Add one line by test you want to create
# usethis::use_test("app")
golem::use_recommended_tests()

# Documentation

## Vignette ----
# usethis::use_vignette("popo")
# devtools::build_vignettes()
usethis::use_vignette("AnimateGraph")
usethis::use_vignette("summaryPlots")
usethis::use_vignette("carolinaKernels")

rstudioapi::navigateToFile("dev/03_deploy.R")
