library(shiny)
library(ggplot2)
library(RColorBrewer)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("How does sampling method influence our results?"),
  # Sidebar with checkboxes
  sidebarLayout(checkboxGroupInput("my_sample_type", label="Sampling Method:",
                                   choices=c('trawl', 'angler', 'weir'),
                                   selected=c('trawl', 'angler', 'weir')),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("distPlot")))))