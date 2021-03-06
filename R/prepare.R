##' Prepare eyetrack data table for analysis.
##'
##' This function prepares an eyetrack data table for subsequent analyses. It modifies the data.table
##' in the following ways:
##' \itemize{
##' \item{It converts the column names to CamelCase}
##' \item{It converts the input to a data.table, if necessary}
##' \item{It checks whether the data.table contains all necessary columns}
##' \item{It retains the columns of either the right, or the left eye, either based on the argument 
##' \code{eye}, or by assessing which column in the data.table does not contain any information.}
##' \item{It renames the coordinate columns to \code{X} and \code{Y}, the dilation column to 
##' \code{Dil}, and the \code{Timestamp} column to \code{Time}.}
##' }
##'
##' @param dvData a data.frame or data.table as generated by SR-Research's DataViewer. 
##' @param eye a character string indicating whether the \code{left} or \code{right} eye 
##' information has to be retained, or whether this has to be \code{autodetect}ed.  
##' 
##' @return Returns a \code{data.table} with, at least, the following columns:
##' \itemize{
##' \item{\code{Time}} time points at which he samples were recorded (the original column \code{time})
##' \item{\code{X}} x-positions of the selected eye
##' \item{\code{Y}} y-positions of the selected eye
##' \item{\code{Dil}} recorded dilation values of the selected eye
##' }
##' The \code{data.table} is sorted by \code{Time}.
##' 
##' @author Hedderik van Rijn
##' @name prepare
##' @export prepare
##' @import data.table 

prepare <- function(dvData, eye="autoselect") {
    if (!is.data.table(dvData)) {
        dat <- as.data.table(dvData)
    } else {
        ## Make sure that we're not going to modify the original dvData
        dat <- copy(dvData)
    }
    
    names(dat) <- toCamelCase(names(dat))
    
    critColumns <- c("Timestamp",
                   "LeftGazeX","LeftGazeY","LeftPupilSize","LeftInBlink","LeftInSaccade",
                   "RightGazeX","RightGazeY","RightPupilSize","RightInBlink","RightInSaccade")
    
    
    if (!all(critColumns %in% names(dat))) {
        stop("first argument has unexpected structure, see help(selecteye)")
    }
    
    if (eye == "autodetect") {
        if (all(is.na(dat$LeftGazeX))) {
            eye <- "right"
        } else {
            eye <- "left"
        }
    }
    
    names(dat) <- gsub("Gaze","",names(dat))
    names(dat) <- gsub("PupilSize","Dil",names(dat))
    names(dat) <- gsub("Timestamp","Time",names(dat))

    if (eye == "left") {
        dat <- dat[,-grep("Right",names(dat)),with=FALSE]
        names(dat) <- gsub("Left","",names(dat))
    } else {
        dat <- dat[,-grep("Left",names(dat)),with=FALSE]
        names(dat) <- gsub("Right","",names(dat))
    }

    setkey(dat,Time)
    return(dat)
}
