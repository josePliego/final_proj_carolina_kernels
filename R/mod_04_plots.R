#' 04_plots UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_04_plots_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$div(
      plotOutput(ns("sum_plot"))
    )
  )
}

#' 04_plots Server Functions
#'
#' @noRd
mod_04_plots_server <- function(id, r) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$sum_plot <- renderPlot({
      getPlot_kick_result(PLAYS, stringr::str_remove(r$play_type, "s$"))
    })
  })
}

## To be copied in the UI
# mod_04_plots_ui("04_plots_ui_1")

## To be copied in the server
# mod_04_plots_server("04_plots_ui_1")
