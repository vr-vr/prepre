## Part of the prepre library
##
## 2015 Hedderik van Rijn
##

library(shiny)

shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Blink Inspector"),
    
    sidebarPanel(
        sliderInput("whichBlink", 
                    "Which blink to inspect:", 
                    min = 1,
                    max = numBlinks(get("pddt", envir=prepre:::prepreEnv)), 
                    value = 1, step=1),
        sliderInput("expandWin", "How much additional time to plot:", 
                    min = 0, max = 1000, value = 500, step= 100),
        sliderInput("cutoff", "What cutoff value to display:", 
                    min = 0, max = 1000, value = 100, step= 10),
        actionButton("stopApp", label = "Done")
    ),
    
    mainPanel(
        plotOutput("inspectBlinkShiny")
    )
))
