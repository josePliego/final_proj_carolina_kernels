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
      class = "page",
      id = ns("pag0"),
      mod_01_cover_ui(ns("01_cover_ui_1"))
    ),
    shinyjs::hidden(
      tags$div(
        class = "page",
        id = ns("pag1")
      ),
      tags$div(
        class = "page",
        id = ns("pag2")
      )
    )
  )
}

#' 00_main Server Functions
#'
#' @noRd
mod_00_main_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    r <- reactiveValues(pag = 0)

    mod_01_cover_server("01_cover_ui_1", r)

    observe({
      shinyjs::hide(selector = ".page")
      shinyjs::show(paste0("pag", r$pag))
      print(r$pag)
    })

    # observe(input$go, {
    #
    # })

  })
}

## To be copied in the UI
# mod_00_main_ui("00_main_ui_1")

## To be copied in the server
# mod_00_main_server("00_main_ui_1")
