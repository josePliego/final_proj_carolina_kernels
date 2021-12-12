#' 04_summaries UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_04_summaries_ui <- function(id){
  ns <- NS(id)
  tagList(
    tags$div(
      tableOutput(ns("table"))
      )
    )
}

#' 04_summaries Server Functions
#'
#' @noRd
mod_04_summaries_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$table <- renderTable(shinipsum::random_table(10, 5))
  })
}

## To be copied in the UI
# mod_04_summaries_ui("04_summaries_ui_1")

## To be copied in the server
# mod_04_summaries_server("04_summaries_ui_1")
