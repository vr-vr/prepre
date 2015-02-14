##' Converts a vector of text strings with elements deliminated by a separator to CamelCase
##'
##' Converts a vector of text strings consisting of multiple word combinations separated by 
##' underscores (or an other given character) to CamelCase, indicating that every word starts
##' with a capital, and all other letters are converted to lowercase.
##'    
##' @param x vector of character strings to convert
##' @param sep separator character between words in input vector
##' 
##' @return vector of converted character strings
##'  
##' @author Hedderik van Rijn
##' @name toCamelCase
##' @export toCamelCase

toCamelCase <- function(x, sep="_") {
    s <- strsplit(x, sep)
    s <- sapply(s,function(s) { paste(toupper(substring(s,1,1)), tolower(substring(s, 2)), sep="", collapse="")})
    return(unlist(s))
}
