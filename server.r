library(shiny)
library(ggplot2)
library(dplyr)
library(readxl)

# Baca dataset dari file Excel
data <- read_excel("dataset_tugas3_msim4310.xls", skip = 2)

# Definisikan logika server untuk aplikasi Shiny
server <- function(input, output, session) {
  
  # Perbarui pilihan di selectInput berdasarkan kolom dalam dataset
  updateSelectInput(session, "xvar", choices = names(data))
  updateSelectInput(session, "yvar", choices = names(data))
  
  filteredData <- reactive({
    req(input$xvar, input$yvar)
    data %>%
      select(all_of(input$xvar), all_of(input$yvar))
  })
  
  output$plot <- renderPlot({
    req(input$update)
    plotData <- filteredData()
    
    p <- ggplot(plotData, aes_string(x = input$xvar, y = input$yvar))
    
    if (input$plotType == "scatter") {
      p <- p + geom_point()
    } else if (input$plotType == "line") {
      p <- p + geom_line()
    } else if (input$plotType == "bar") {
      p <- p + geom_bar(stat = "identity")
    }
    
    p + theme_minimal()
  })
  
  output$dataTable <- renderTable({
    data
  })
}
