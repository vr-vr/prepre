\name{normalize}
\alias{normalize}
\title{Normalizes the pupillary response relative to a given baseline}
\arguments{
  \item{pddt}{a pupil dilation \code{data.table} containing
  at least the following two columns: \itemize{
  \item{\code{Dil}} containing the dilation values
  \item{\code{Trial}} indicating to which trial the current
  sample belongs }}

  \item{baselineRange}{a boolean vector specifying the
  samples that make up the baseline}

  \item{by}{a optional character vector naming the columns
  that together with \code{Trial} define a cell (e.g.,
  \code{c("Subj")}).}
}
\value{
  Returns an updated copy of the original \code{data.table}
  with two additional columns: \itemize{ \item{\code{DilN}}
  the normalized pupillary response \item{\code{Baseline}}
  the calculated baseline in \code{Dil} units }
}
\description{
  Calculates a relative pupillary response based on a
  baseline defined per \code{Trial}. The baseline is
  defined as the mean of the \code{Dil} samples over the
  given \code{baselineRange}, and the relative pupillary
  response is calculated as \code{(Dil -
  Baseline)/Baseline}, effectively resulting in a relative
  dilation of 0 at the baseline. Note that baselineRange
  needs to be true for at least one sample per
  \code{Trial}.
}
\details{
  Note that if \code{pddt} contains the data of multiple
  participants, not specifying the column identifying the
  participants using the argument \code{by} will probably
  not result in interpretable data (as a baseline averaged
  over participants will be calculated for each
  \code{Trial}).
}
\author{
  Hedderik van Rijn
}

