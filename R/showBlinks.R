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
    ## Make sure that the shiny functions can access our data. There is probably a better way to do this, but for
    ## now this will do. (Might be better to create a variable within the prepre scope. Need to look into this later.)
    showBlinksData <<- pddt
    shiny::runApp(system.file('showBlinks', package='prepre'))
    rm(showBlinksData,pos = ".GlobalEnv")
}