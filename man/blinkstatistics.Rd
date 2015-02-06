\name{blinkstatistics}
\alias{blinkstatistics}
\title{Calculates a number of statistics on the incidence of blinks in the given data table}
\arguments{
  \item{pddt}{a pupil dilation \code{data.table} of a
  single participant containing at least the following two
  columns: \itemize{ \item{Dil} containing the dilation
  values with all blinks marked as NA. \item{Trial}
  indicating to which trial the current row belongs. }}
}
\value{
  A \code{list} with the following fields: \itemize{
  \item{OverallProportion} the proportion of data points
  marked as blink \item{OverallOnset} the number of times
  the onset of a blink is detected
  \item{PerTrialProportion} the proportion of data points
  marked as blink per trial \item{PerTrialOnset} the number
  of times the onset of a blink is detected per trial }
}
\description{
  Returns the proportion and the number of consecutive runs
  of blink-marked data points (the latter being an estimate
  of the number of blinks), both overall and calculated
  separately for each trial. Note that the function assumes
  the input to be in chronological order within each trial.
}
\author{
  Hedderik van Rijn
}

