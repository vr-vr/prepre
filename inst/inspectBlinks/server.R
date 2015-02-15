## Part of the prepre library
##
## 2015 Hedderik van Rijn
##

library(shiny)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
    
    output$inspectBlinkShiny <- renderPlot({
        if (input$stopApp) {
            stopApp(list(cutoff=input$cutoff))
        }
        plotBlink(get("pddt", envir=prepre:::prepreEnv),input$whichBlink,input$expandWin,input$cutoff)
    })
})