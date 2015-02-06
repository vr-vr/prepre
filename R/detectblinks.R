##' Detects blinks based on dilatation and velocity measure
##'
##' Changes dilation values to NA if either absolute dilation is below or the difference with the 
##' previous dilation value is above a given value. Default values work well when using 
##' a SR Research Eyelink 1000 setup in a normally lit window-less experimental room, with 
##' a typical experimental setup for psychological experiment and recording at 1000 Hz. 
##' Note that the function assumes the input to be in chronological order within each trial.
##' 
##' @param pddt a pupil dilation \code{data.table} of a single participant containing at least the following two columns: 
##' \itemize{
##' \item{Dil} containing the dilation values with all blinks marked as NA. 
##' \item{Trial} indicating to which trial the current row belongs. 
##' }
##' @param minDilation the dilation value below which a sample is considered to be part of a blink
##' @param maxDeltaDilation if difference with previous sample is larger than given number, it's considered to be part of a blink
##'  
##' @return Returns an updated copy of the original \code{data.table}:
##' \itemize{
##' \item{Dil} a copy of the original \code{Dil} column, but samples replaced with \code{NA} 
##' when this sample is considered to be a blink
##' \item{DilDiff} the delta pupil dilation compared to the previous sample
##' }
##' 
##' @author Hedderik van Rijn
##' @export detectblinks
##' @import data.table
##' @name detectblinks

require(data.table)

detectblinks <- function(pddt,minDilation=500,maxDeltaDilation=5) {
    
    ## Reject blinks. Anything with a dilation below minDilation is considered a blink
    pddt[Dil < minDilation, Dil := NA]
    
    ## However, some participants seem to "sometimes" partily close their eyes, resulting in "sudden drops"
    ## in dilatation. Therefore, add a velocity based measure as well.
    pddt[,DilP := shift(Dil,-1),by=Trial]
    pddt[,DilDiff := abs(DilP - Dil)]
    ## Remove previous dilation column, is typically not needed
    pddt$DilP <- NULL
    pddt[DilDiff > maxDeltaDilation, Dil := NA]
    return(pddt)
}
