% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{PLAYS}
\alias{PLAYS}
\title{Contains data on plays: Extra Point, Field Goal, Kickoff or Punt}
\format{
A data frame with 19979 rows and 25 variables: \describe{
  \item{gameId}{Game identifier, unique} \item{playId}{Play identifier, not
  unique across games} \item{playDescription}{Description of play}
  \item{quarter}{Game quarter} \item{down}{down} \item{yardsToGo}{Distance
  needed for a first down} \item{possessionTeam}{Team
  punting, placekicking or kicking off the ball}
  \item{specialTeamsPlayType}{Formation of play: Extra Point, Field Goal,
  Kickoff or Punt} \item{specialTeamsResult}{Special Teams outcome of play
  dependent on play type: Blocked Kick Attempt, Blocked Punt, Downed, Fair
  Catch, Kick Attempt Good, Kick Attempt No Good, Kickoff Team Recovery,
  Muffed, Non-Special Teams Result, Out of Bounds, Return or Touchback}
  \item{kickerId}{nflId of placekicker, punter or kickoff specialist on play}
  \item{returnerId}{nflId(s) of returner(s) on play if there was a special
  teams return. Multiple returners on a play are separated by a}
  \item{kickBlockerId}{nflId of blocker of kick on play if there was a
  blocked field goal or blocked punt} \item{yardlineSide}{3-letter team code
  corresponding to line-of-scrimmage} \item{yardlineNumber}{Yard line at
  line-of-scrimmage} \item{gameClock}{Time on clock of play}
  \item{penaltyCodes}{ NFL categorization of the penalties that occurred on
  the play. A standard penalty code followed by a d means the penalty was on
  the defense. Multiple penalties on a play are separated by a}
  \item{penaltyJerseyNumbers}{Jersey number and team code of the player
  committing each penalty. Multiple penalties on a play are separated by a }
  \item{penaltyYards}{yards gained by possessionTeam by penalty}
  \item{preSnapHomeScore}{Home score prior to the play}
  \item{preSnapVisitorScore}{Visiting team score prior to the play}
  \item{passResult}{Scrimmage outcome of the play if specialTeamsPlayResult
  is "Non-Special Teams Result" (C: Complete pass, I: Incomplete pass, S:
  Quarterback sack, IN: Intercepted pass, R: Scramble, ' ': Designed Rush,
  text)} \item{kickLength}{Kick length in air of kickoff, field goal or punt}
  \item{kickReturnYardage}{Yards gained by return team if there was a return
  on a kickoff or punt} \item{playResult}{Net yards gained by the kicking
  team, including penalty yardage} \item{absoluteYardlineNumber}{Location of
  ball downfield in tracking data coordinates} }
}
\source{
\url{https://www.kaggle.com/c/nfl-big-data-bowl-2022/data}
}
\usage{
PLAYS
}
\description{
A dataset containing the play details such as yards to go, down, penalty
yards, kick length etc.
}
\keyword{datasets}
