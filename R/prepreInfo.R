#'Prints the version information for the prepre package
#'
#'Prints the version, revision, and date information for the prepre package
#'
#'This function prints the version and revision information for the prepre
#'package.
#'
#'@param print if \code{TRUE}, print version information to the console
#'@return \code{prepreInfo} returns a character string containing the version and
#'  revision number of the package.
#'@author Based on BFInfo by Richard D. Morey, modified for prepre by Hedderik van Rijn
#'@keywords misc
#'@export
prepreInfo <- function(print=TRUE)
{
    if(print){
        cat("Package prepre\n")
        cat(packageDescription("prepre")$Version,"\n")
    }
    retStr = paste(packageDescription("prepre")$Version)
    invisible(retStr)
} 
