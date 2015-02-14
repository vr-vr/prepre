##' Plots a blink plus surrounding data and an indication of the cutoff thresholds
##' 
##' Creates a plot showing a blink (sequential number defined by argument \code{blink}) including
##' some data before and after the blink (\code{expand}, defined in miliseconds) and plots (if 
##' specified) two vertical lines indicating potential cutoff criteria.
##' 
##' @param pddt A pddt data frame
##' @param blink Which blink to display
##' @param expand How much data (in ms) to plot before and after the blink
##' @param cutoff Where to plot the visual indicators for the cutoff (if NA, no indicators will be plotted)
##' 
##' @author Hedderik van Rijn
##' @name numBlinks
##' @export numBlinks
##' @import data.table 


plotBlink <-function(pddt,blink,expand,cutoff=NA) {
    
    ## Figure out what the recording frequency is:
    recHz <- 1000/diff(pddt$Time[1:2])
    ## Calculate how many samples to set to NA:
    rejRegion <- expand/1000 * recHz
    cutoff <- cutoff/1000 * recHz
    
    r <- rle(pddt$InBlink)
    r$index <- cumsum(r$lengths)
    r$nblink <- ifelse(r$values==1,cumsum(r$values),0)
    
    startVal <- r$index[which(r$nblink==blink)-1]-rejRegion
    endVal <- r$index[which(r$nblink==blink)]+rejRegion
    
    pddt[startVal:endVal,plot(Time,Dil,pch=".",axes=FALSE,type="l",xlab="Time Stamp (in ms)",ylab="Dilation")]
    axis(1)
    axis(2)
    
    if (!is.na(cutoff)) {
        pddt[c(r$index[which(r$nblink==blink)-1]-cutoff,
               r$index[which(r$nblink==blink)]+cutoff), abline(v=Time,lty=2,col="darkred")]
    }
}
