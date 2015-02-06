##' Calculates a number of statistics on the incidence of blinks in the given data table
##'
##' Returns the proportion and the number of consecutive runs of blink-marked data 
##' points (the latter being an estimate of the number of blinks), both overall and calculated
##' separately for each trial. Note that the function assumes the input to be in 
##' chronological order within each trial.
##' 
##' @param pddt a pupil dilation \code{data.table} of a single participant containing at least the following two columns: 
##' \itemize{
##' \item{Dil} containing the dilation values with all blinks marked as NA. 
##' \item{Trial} indicating to which trial the current row belongs. 
##' }
##' 
##' @return A \code{list} with the following fields:
##' \itemize{
##' \item{OverallProportion} the proportion of data points marked as blink
##' \item{OverallOnset} the number of times the onset of a blink is detected
##' \item{PerTrialProportion} the proportion of data points marked as blink per trial
##' \item{PerTrialOnset} the number of times the onset of a blink is detected per trial
##' }
##' 
##' @export blinkstatistics
##' @author Hedderik van Rijn
##' @import data.table
##' @name blinkstatistics

require(data.table)

blinkstatistics <- function(pddt) {
    pddt[,DilIsBlink := is.na(Dil)]
    
    info <- list()
    info$OverallProportion <- pddt[,mean(is.na(Dil))]
    info$OverallOnsets <- pddt[,sum(diff(DilIsBlink)==1)]

    info$PerTrialProportion <- pddt[,list(Proportion=mean(is.na(Dil))),by=Trial]
    info$PerTrialOnsets <- pddt[,list(Onsets=sum(diff(DilIsBlink)==1)),by=Trial]

    return(info)
}
