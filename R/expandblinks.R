##' Expand blink regions to account for pre- and post-blink changes in dilatation
##'
##' Sets samples within a specified time range before and after each observed blink to \code{NA} as just
##' before and after a blink the pupillary response is often slightly effected. Note that 
##' the function assumes the input to be in chronological order within each trial.
##' 
##' @param pddt a pupil dilation \code{data.table} of a single participant containing at least the following three columns: 
##' \itemize{
##' \item{Dil} containing the dilation values with all blinks marked as NA. 
##' \item{Trial} indicating to which trial the current sample belongs.
##' \item{Time} Real in miliseconds associated with each sample. Is used to calculate at 
##' which frequency this data was sampled.
##' }
##' @param rejectionWindow duration (in miliseconds) of the rejection window. All samples 
##' closer to a sample marked as a blink than this value with be set to \code{NA}. 
##' 
##' @return Returns an updated copy of the original \code{data.table}:
##' \itemize{
##' \item{Dil} a copy of the original \code{Dil} column, but samples replaced with \code{NA} 
##' when this sample is considered to be part of a blink
##' }
##' 
##' @author Hedderik van Rijn
##' @name expandblinks
##' @export expandblinks
##' @import data.table


require(data.table)

expandblinks <- function(pddt,rejectionWindow=100) {

    
    ## Figure out what the recording frequency is:
    recHz <- 1000/diff(pddt$Time[1:2])
    ## Calculate how many samples to set to NA:
    rejRegion <- rejectionWindow/1000 * recHz

    ## Reject rejRegion samples around each NA observation:
    .expandblinks <- function(Dil) {
        rej <- which(is.na(Dil))
        rej <- outer(rej, -rejRegion:rejRegion, FUN = "+")
        rej <- rej[rej > 0 & rej <= length(Dil)]
        Dil[rej] <- NA
        return(Dil)
    }
    
    pddt[,Dil := .expandblinks(Dil), by=Trial]

    return(pddt)
}
