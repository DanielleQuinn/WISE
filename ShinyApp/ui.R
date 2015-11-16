library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello Shiny!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(sidebarPanel(inputPanel(selectInput("gear_type", label="Gear Type:",
                             choices=c('Trawl', 'Angler', 'Weir'), selected='Trawl'))),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("distPlot")))))