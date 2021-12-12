#' 02_playtype UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_02_playtype_ui <- function(id){
  ns <- NS(id)
  tagList(
    # shinyWidgets::setBackgroundImage(src = "www/background3.jpeg"),
    uiOutput(ns("header")),
    sidebarLayout(
      sidebarPanel = sidebarPanel(
        h3("Filters")
      ),
      mainPanel = mainPanel(tabsetPanel(
        type = "tabs",
        tabPanel(
          "Summary Statistics",
          mod_04_summaries_ui(ns("04_summaries_ui_1"))
        ),
        tabPanel("Plots")
      )
    ))
  )
}

#' 02_playtype Server Functions
#'
#' @noRd
mod_02_playtype_server <- function(id, r){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$header <- renderUI({
      h2(paste(stringr::str_remove(r$play_type, "s$"), "Analysis"))
    })
    mod_04_summaries_server("04_summaries_ui_1")
  })
}

## To be copied in the UI
# mod_02_playtype_ui("02_playtype_ui_1")

## To be copied in the server
# mod_02_playtype_server("02_playtype_ui_1")
