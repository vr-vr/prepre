##' Start the Shiny Blink Inspector.
##'
##' Starts a Shiny app to allow for the inspection of blinks. Main purpose is to see how much data
##' around the blinks need to be rejected.
##' 
##' @author Hedderik van Rijn
##' @name inspectBlinks
##' @export inspectBlinks
##' @import data.table 
##' @import shiny

inspectBlinks <- function(pddt) {
    assign("pddt", pddt, envir=prepreEnv)
    shiny::runApp(system.file('inspectBlinks', package='prepre'))
    rm("pddt",envir = prepreEnv)
}