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
            label = "Choose a Play Type to Analyze:",
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
              "Choosing a Play Type will lead you to various plots that summarize it",
              "Use Filters to select an aspect of the Play Type",
              "And click Show Plot to show the plot of the aspect",
              "Clicking Play Analysis on the bottom right will lead you to the dynamic visualization of various plays",
              "Choose a play to see its dynamic visualization",
              "Press Back to go back to the previous page"
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
