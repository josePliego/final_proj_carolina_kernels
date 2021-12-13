#' 03_playvis UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_03_playvis_ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("header")),
    tags$div(
      fluidRow(
        column(4),
        column(
          4,
          class = "cover",
          align = "center",
          selectInput(
            ns("play"),
            "Choose a play:",
            choices = list.files(app_sys("app/cache/gifs/"))
          )
        ),
        column(4)
      )
    ),
    tags$div(
      class = "gif",
      imageOutput(ns("play_plot"))
    ),
    tags$br(),
    tags$div(
      h4("About the Animation"),
      paste(
        "Each play type (extra point, punt, field goal, and kickoff) are selectable in the dropdown menu.",
        "The animations are precompiled into gif files to reduce load times and improve user experience.",
        "Each dot represents a player and the brown triangle is the football.",
        "White horizontal lines denote the hash marks and the yellow vertical bars represent goal posts.",
        "Gif file names are shown in the drop down menu and delineate the play type and result separated by underscore."
      )
    )
  )
}

#' 03_playvis Server Functions
#'
#' @noRd
mod_03_playvis_server <- function(id, r) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$header <- renderUI({
      h2(paste(stringr::str_remove(r$play_type, "s$"), "Dynamic Visualization"))
    })
    observeEvent(input$play, {
      play <- as.character(input$play)
      img_dir <- paste0(app_sys("app/cache/gifs/"), "/", input$play)
      output$play_plot <- renderImage(
        {
          list("src" = img_dir)
        },
        deleteFile = FALSE
      )
    })
  })
}

## To be copied in the UI
# mod_03_playvis_ui("03_playvis_ui_1")

## To be copied in the server
# mod_03_playvis_server("03_playvis_ui_1")
