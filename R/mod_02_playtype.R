#' 02_playtype UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_02_playtype_ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("header")),
    sidebarLayout(
      sidebarPanel = sidebarPanel(
        h3("Filters"),
        uiOutput(ns("plot_types"))
      ),
      mainPanel = mainPanel(
        h3("Plots"),
        mod_04_plots_ui(ns("04_plots_ui_1"))
        )
      )
    )
}

#' 02_playtype Server Functions
#'
#' @noRd
mod_02_playtype_server <- function(id, r) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observe({
      r$dt <- carolinaKernels::PLAYS %>%
        dplyr::left_join(
          carolinaKernels::PFFScoutingData %>%
            dplyr::select(
              .data$gameId,
              .data$playId,
              .data$snapDetail,
              .data$kickDirectionIntended,
              .data$kickDirectionActual,
              .data$hangTime
            ),
          by = c("gameId","playId")
        )

      output$plot_types <- renderUI({
        tags$div(
          selectInput(
            ns("plot_selection"),
            label = "Select a plot to show:",
            choices = unlist(make_plot_list(r$play_type))
          ),
          actionButton(
            ns("show"),
            "Show Plot",
            icon = icon("chart-bar")
          )
        )
      })

      observeEvent(input$show, {
        r$plot_selection <- input$plot_selection
        mod_04_plots_server("04_plots_ui_1", r)
      })

    })

    output$header <- renderUI({
      h2(paste(r$play_type, "Analysis"))
    })
    # mod_04_plots_server("04_plots_ui_1", r)
  })
}

## To be copied in the UI
# mod_02_playtype_ui("02_playtype_ui_1")

## To be copied in the server
# mod_02_playtype_server("02_playtype_ui_1")
