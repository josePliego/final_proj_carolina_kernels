#' 01_cover UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_01_cover_ui <- function(id) {
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
            label = "Choose a Play Type to Analize:",
            choices = list(
              "Field Goals",
              "Extra Points",
              "Punts",
              "Kickoffs"
            )
          ),
          shinyWidgets::actionBttn(
            ns("go"),
            "Get Started!",
            style = "bordered"
          ),
          tags$br(),
          tags$br(),
          tags$div(
            class = "about",
            h4("How to use the app"),
            paste(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              "Cras ac tincidunt mi. Etiam et porttitor lorem, sed sodales",
              "tortor. Duis ut aliquet lectus. Nam volutpat posuere dolor non",
              "fringilla. Donec ac porta dolor. Phasellus malesuada et risus",
              "eu malesuada. Praesent purus dolor, placerat eget orci ac,",
              "vehicula fermentum mi. Nam pharetra nulla sed arcu egestas, sit",
              "amet consequat mauris scelerisque. Proin in tortor leo. In hac",
              "habitasse platea dictumst."
            )
          ),
          tags$br(),
          tags$br(),
          tags$div(
            "Image from https://getwalls.io/nfl-football-hd-wall-294704/"
          )
        ),
        column(2)
      )
    )
  )
}

#' 01_cover Server Functions
#'
#' @noRd
mod_01_cover_server <- function(id, r) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    observeEvent(input$go, {
      r$play_type <- as.character(stringr::str_remove(input$choice, "s$"))
      r$pag <- 1
    })
  })
}

## To be copied in the UI
# mod_01_cover_ui("01_cover_ui_1")

## To be copied in the server
# mod_01_cover_server("01_cover_ui_1")
