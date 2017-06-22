#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)
library(ggthemes)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$text1 = renderText(input$slider2)
  
  output$plot <- renderPlotly({
    plot_ly(mtcars, x = ~mpg, y = ~wt)
  })
  
  output$event <- renderPrint({
    d <- event_data("plotly_hover")
    if (is.null(d)) "Hover on a point!" else d
  })
  
  output$plot <- renderPlotly({
    plot_ly(mtcars, x = ~mpg, y = ~wt)
  })
  
  output$plot2 <- renderPlotly({
    print(
      ggplotly(
        ggplot(data = mtcars, aes(x = disp, y = cyl)) + geom_smooth(method = 
                                                                      lm, formula = y~x) + geom_point() + theme_gdocs()))
  })
  
  output$ggplot2_shiny <- renderPlotly({
  g <- ggplot(data=mtcars, aes(x=wt,y=mpg,color= factor(am))) + geom_point()
   ggplotly(g)
  })
  

})
