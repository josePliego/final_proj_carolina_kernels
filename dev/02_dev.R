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

# Engineering

## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "00_main")
golem::add_module(name = "01_cover")
golem::add_module(name = "02_playtype")
golem::add_module(name = "03_playvis")
golem::add_module(name = "04_summaries")
golem::add_module(name = "05_plots")

## Add helper functions ----
## Creates fct_* and utils_*
# golem::add_fct("helpers")
# golem::add_utils("helpers")

## External resources
## Creates .css file at inst/app/www
golem::add_css_file("custom")

## Add internal datasets ----
## If you have data in your package
# usethis::use_data_raw(name = "my_dataset", open = FALSE)

## Tests ----
## Add one line by test you want to create
# usethis::use_test("app")

# Documentation

## Vignette ----
# usethis::use_vignette("popo")
# devtools::build_vignettes()
usethis::use_vignette("summaryPlots")

rstudioapi::navigateToFile("dev/03_deploy.R")
