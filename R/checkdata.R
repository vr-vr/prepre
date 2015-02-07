##' Checks whether the given argument meets the minimum requirements for PrePRe functions
##' 
##' \code{checkdata} checks whether the given argument is a \code{data.table}, and if not converts the
##' argument to a \code{data.table}, checks whether the \code{data.table} contains the required columns
##' (i.e., both \code{Dil} and \code{Time}), and ensures that the \code{data.table} is sorted correctly
##' as the PrePRe functions assume that all dilation samples are stored sequentially.
##' 
##' Note that this function is not exported, it main purpose is to be used internally by PrePRe functions.
##' 
##' @param pddt the data.table or data.frame that will be tested
##' 
##' @return \code{NULL} if \code{pddt} does not meet the minimum requirements, or the \code{data.table} sorted by the \code{Time} column.
checkdata <- function(pddt) {
    requiredColumns <- c("Dil","Time")

    if (!is.data.table(pddt)) {
        if (is.data.frame(pddt)) {
            pddt <- as.data.table(pddt)
        } else {
            pddt <- NULL
        }
    }
    
    if (is.data.table(pddt)) {
        if (!all(requiredColumns %in% names(pddt))) {
            cat("Invalid pddt data\n")
            pddt <- NULL
        } else {
            if (key(pddt) != "Time") {
                setkey(pddt,"Time")
            }
        }
    }
    
    return(pddt)
}
