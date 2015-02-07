\name{prepre-package}
\alias{prepre-package}
\alias{prepre}
\docType{package}
\title{
PREprocessing of Pupillary REsponse data
}
\description{
Functions for preprocessing of pupillary data, including blink detection, blink interpolation, baselining, etc. 
}
\details{
\tabular{ll}{
Package: \tab prepre\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2015-02-06\cr
License: \tab GPL \cr
}

As the continuous sampling of the pupillary response results in large data sets, this package relies on the data.table package. All functions assume that pupillary data is stored in a data.table that contains the following columns:




}
\author{
Hedderik van Rijn
Jacolien van Rij

Maintainer: Please sent all comments to <vr-vr@van-rijn.org>

}
\references{
NEEDS TO BE UPDATES
}
\keyword{ package }
\seealso{
\code{\link[data.table:data.table-package]{data.table}} ~~
}
\examples{
## Load in a dataset collected with a SR Research 1000 eyetracker, EDF file parsed with EDF2R package.
data(prepreDemo)

## Ignore the event messages, and just work with the samples:
dat <- as.data.table(prepreDemo$samples)

}
