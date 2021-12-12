#' 05_plots UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_05_plots_ui <- function(id){
  ns <- NS(id)
  tagList(
    tags$div(
      plotOutput(ns("sum_plot"))
    )
  )
}

#' 05_plots Server Functions
#'
#' @noRd
mod_05_plots_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$sum_plot <- renderPlot({
      shinipsum::random_ggplot() +
        ggplot2::theme_dark()
        })
  })
}

## To be copied in the UI
# mod_05_plots_ui("05_plots_ui_1")

## To be copied in the server
# mod_05_plots_server("05_plots_ui_1")
