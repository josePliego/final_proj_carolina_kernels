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
        id = ns("pag1"),
        mod_02_playtype_ui(ns("02_playtype_ui_1"))
      ),
      tags$div(
        class = "page",
        id = ns("pag2"),
        mod_03_playvis_ui(ns("03_playvis_ui_1"))
      )
    ),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$div(
      class = "back",
      actionButton(
        ns("back_btn"),
        "Back",
        icon = icon("arrow-alt-circle-left")
      )
    ),
    tags$div(
      class = "next",
      actionButton(
        ns("next_btn"),
        "Play Analysis",
        icon = icon("arrow-alt-circle-right")
      )
    ),
    tags$br()
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
      shinyjs::toggle(id = "back_btn", condition = r$pag != 0)
      shinyjs::toggle(id = "next_btn", condition = r$pag != 0)
      shinyjs::toggleState(id = "back_btn", condition = r$pag > 0)
      shinyjs::toggleState(id = "next_btn", condition = r$pag > 0)
      shinyjs::toggle(id = "next_btn", condition = r$pag > 0 & r$pag < 2)
      shinyjs::hide(selector = ".page")
      shinyjs::show(paste0("pag", r$pag))
    })

    observeEvent(r$pag, {
      if (r$pag == 1) mod_02_playtype_server("02_playtype_ui_1", r)
      if (r$pag == 2) mod_03_playvis_server("03_playvis_ui_1", r)
    })

    observeEvent(input$back_btn, {
      r$pag <- r$pag - 1
    })

    observeEvent(input$next_btn, {
      r$pag <- r$pag + 1
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
