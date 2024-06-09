library(shiny)

# Definisikan UI untuk aplikasi Shiny
ui <- fluidPage(
  titlePanel("Visualisasi Data Stasiun Meteorologi Samarinda, 2015"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "Pilih Variabel X:",
                  choices = NULL),  # Kita akan memperbarui choices di server
      selectInput("yvar", "Pilih Variabel Y:",
                  choices = NULL),  # Kita akan memperbarui choices di server
      selectInput("plotType", "Pilih Jenis Plot:",
                  choices = c("Scatter Plot" = "scatter",
                              "Line Plot" = "line",
                              "Bar Plot" = "bar")),
      actionButton("update", "Update Plot")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot")),
        tabPanel("Data Tabel", tableOutput("dataTable"))
      )
    )
  )
)
