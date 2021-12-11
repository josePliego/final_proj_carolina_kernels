#' 01_cover UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_01_cover_ui <- function(id){
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
            choices = list(
              "Play Visualization" = "playvis",
              "Summary Statistics" = "summary",
              "Other" = "other"
            )
          ),
          shinyWidgets::actionBttn(
            ns("go"),
            "Get Started!",
            style = "bordered"
            ),
          tags$br(),
          tags$br(),
          tags$br()
        ),
        column(2)
      )
    )
  )
}

#' 01_cover Server Functions
#'
#' @noRd
mod_01_cover_server <- function(id, r){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$go, {
      r$pag <- as.numeric(dplyr::case_when(
        input$choice == "playvis" ~ 1,
        input$choice == "summary" ~ 2,
        input$choice == "other" ~ 3,
        TRUE ~ 0
      ))
    })
  })
}

## To be copied in the UI
# mod_01_cover_ui("01_cover_ui_1")

## To be copied in the server
# mod_01_cover_server("01_cover_ui_1")
