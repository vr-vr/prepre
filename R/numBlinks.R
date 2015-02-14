##' Returns the number of blinks in the given data table.
##' 
##' @author Hedderik van Rijn
##' @name numBlinks
##' @export numBlinks
##' @import data.table 


numBlinks <- function(pddt) {
    sum(rle(pddt$InBlink)$values)
}
