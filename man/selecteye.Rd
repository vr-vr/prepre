\name{selecteye}
\alias{selecteye}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
selects the eye to use for all subsequent analyses
}
\description{
All \code{pR} commands are written to perform analyses on a single vector of pupil dilation variables. This function selects either the left or right eye based on the given argument, or tries to figure out whether either the left or right eye was recorded and selects that eye for further processing.
}
\usage{
selecteye(samples,eye="autoselect")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{samples}{a data.frame as returned by \code{readEDF} containing exactly the 
  following seven columns \code{Time}, \code{xL}, \code{yL}, \code{dilL}, \code{xR},
  \code{yR}, \code{dilR}. The columns need to be in exactly this order to allow for 
  fast selection.}
  \item{eye}{Specifies which eye to use for further processing (by setting argument to \code{"left"} or \code{"right"}. Alternatively, when using the default \code{"autoselect"}, the code with autodetect whether the left or right eye was recorded and use that information.
  }
}

\details{
Note that this code selects either the data associated with the left or right eye, and removes the data associated with the other eye from the data set. If both eyes were recorded and \code{"autodetect"} was provided as argument, the right eye information is retained. 
}
\value{
A \code{data.table} containing the following columns:
\item{Time}{The time at which this sample was recorded}
\item{X}{The X-location associated with this sample}
\item{Y}{The Y-location associated with this sample}
\item{Dil}{The dilation associated with this sample}
}
\references{
http://www.van-rijn.org/pR
}
\author{
Hedderik van Rijn, 
}
\note{The intended way of using this command is:
\code{curdat <- readEDF("oneParticipantsData.EDF")
samples <- selecteye(curdat$samples)}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{readEDF}}
}

%\examples{
%##---- Should be DIRECTLY executable !! ----
%##-- ==>  Define data, use random,
%##--	or do  help(data=index)  for the standard data sets.
%
%## The function is currently defined as
%function (x) 
%{
%  }
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
