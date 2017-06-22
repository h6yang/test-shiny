#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hai test shiny"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h1("Move the Slider!"),
       sliderInput("slider2","Slide Me!", 0, 100, 0),
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Main panel Text"),
       textOutput("text1"),
       plotOutput("distPlot"),
       plotlyOutput("plot"),
       verbatimTextOutput("event"),
       plotlyOutput("plot2"),
       plotlyOutput("ggplot2_shiny")
       
    )
  )
))
