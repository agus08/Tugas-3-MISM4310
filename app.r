library(shiny)

# Sumberkan file UI dan server
print("Memuat file ui.R")
source("ui.R")
print("Memuat file server.R")
source("server.R")

# Jalankan aplikasi Shiny
print("Menjalankan aplikasi Shiny")
shinyApp(ui = ui, server = server)