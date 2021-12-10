#' 00_main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_00_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    tags$div(
      fluidRow(
        column(2),
        column(
          8,
          class = "cover",
          align = "center",
          h1("Carolina Kernels Final Project"),
          selectInput(
            ns("choice"),
            label = "What do you want to do?",
            choices = list("Play Visualization", "Summary Statistics", "Other")
          ),
          shinyWidgets::actionBttn(
            ns("go"),
            "Get Started!",
            style = "stretch"
          ),
          tags$br()
        ),
        column(2)
      )
    )
  )
}

#' 00_main Server Functions
#'
#' @noRd
mod_00_main_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_00_main_ui("00_main_ui_1")

## To be copied in the server
# mod_00_main_server("00_main_ui_1")
