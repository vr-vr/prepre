##' Downsample pupil dilation data to a given frequency
##'
##' Downsamples the data in the pupil dilation \code{data.table} to a given frequency by calculating the \code{\link{median}}
##' values for subsequent bins. This is the simplest type of downsampling possible, but one that - given the slow
##' pupillary response - is appropriate as long as the output frequency is sufficiently high. Furture work might 
##' incorporate more refined sampling methods as defined in the \code{signal} package.
##' 
##' @param pddt a pupil dilation \code{data.table} of a single participant containing at least the following 
##' four columns: 
##' \itemize{
##' \item{Dil} containing the dilation samples
##' \item{X} X coordinate of the eye associated with each sample
##' \item{Y} Y coordinate of the eye associated with each sample
##' \item{Time} time stamp in ms associated with each sample
##' \item{Trial} indicating to which trial the current sample belongs
##' }
##' @param by a vector of character names of the columns defining unique trials. As the returned \code{data.table} 
##' only contains the columns listed above and the columns specified in this \code{by} argument, typically the 
##' \code{by} parameter also contains the names of the columns containing condition and participant information.
##' 
##' @return Returns an downsampled copy of the original \code{data.table} with the following columns:
##' \itemize{
##' \item{\code{Dil}} downsampled dilation value
##' \item{\code{X}} downsampled X coordinate
##' \item{\code{Y}} downsampled Y coordinate
##' \item{\code{Time}} downsampled time stamp in ms
##' \item{\code{Trial}} indicating to which trial this downsampled sample belongs
##' \item{\code{...}} all columns listed in the \code{by} argument.
##' }
##' 
##' @author Hedderik van Rijn
##' @name downsample
##' @export downsample
##' @import data.table

require(data.table)

downsample <- function(pddt, by, Hz=100) {

    sampleTime <- pddt[,Time[2]-Time[1]]
    binSize <- 1000/Hz
    
    if (binSize %% sampleTime != 0) {
        warning("Sample frequency of data is not a multiple of the target frequency specified in the by argument")
    }
    
    ## Downsample ----
    pddt$DS <- pddt$Time %/% binSize

    ## Do our downsampling per group of cells defined by the combination of the by argument *and* the DS variable
    ## that we just defined.
    allF <- c(by,"DS")

    pddt <- pddt[,list(Dil=median(Dil),X=median(X),Y=median(Y)),by=allF] 
    
    ## Recreate a Time column with time in ms, and remove the column on which the split the data.
    pddt$Time <- pddt$DS * binSize
    pddt$DS <- NULL

    return(pddt)
}