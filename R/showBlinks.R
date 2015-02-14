##' Start the Shiny Blink Inspector.
##'
##' Starts a Shiny app to allow for the inspection of blinks. Main purpose is to see how much data
##' around the blinks need to be rejected.
##' 
##' @author Hedderik van Rijn
##' @name showBlinks
##' @export showBlinks
##' @import data.table 
##' @import shiny

showBlinks <- function(pddt) {
    showBlinksData <<- pddt
    shiny::runApp(system.file('showBlinks', package='prepre'))
    rm(showBlinksData)
}