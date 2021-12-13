#' Contains player tracking data from season 2020.
#'
#' A dataset containing the tracking location of different players across
#' various games
#'
#' @format A data frame with 41561 rows and 19 variables: \describe{
#'   \item{time}{Time stamp of play (time, yyyy-mm-dd, hh:mm:ss)}
#'   \item{x}{Player position along the long axis of the field, 0 - 120 yards.}
#'   \item{y}{Player position along the short axis of the field, 0 - 53.3
#'   yards.} \item{s}{Speed in yards/second} \item{a}{Speed in yards/second^2}
#'   \item{dis}{Distance traveled from prior time point, in yards}
#'   \item{o}{Player orientation (deg), 0 - 360 degrees} \item{dir}{Angle of
#'   player motion (deg), 0 - 360 degrees} \item{event}{Tagged play details,
#'   including moment of ball snap, pass release, pass catch, tackle, etc}
#'   \item{nflId}{Player identification number, unique across players}
#'   \item{displayName}{Player name} \item{jerseyNumber}{Jersey number of
#'   player} \item{position}{Player position group} \item{team}{Team (away or
#'   home) of corresponding player} \item{frameId}{Frame identifier for each
#'   play, starting at 1} \item{gameId}{Game identifier, unique}
#'   \item{playId}{Play identifier, not unique across games}
#'   \item{playDirection}{Direction that the offense is moving} }
#' @source \url{https://www.kaggle.com/c/nfl-big-data-bowl-2022/data}
"TRACKING"

#' Contains data on plays: Extra Point, Field Goal, Kickoff or Punt
#'
#' A dataset containing the play details such as yards to go, down, penalty
#' yards, kick length etc.
#'
#' @format A data frame with 19979 rows and 25 variables: \describe{
#'   \item{gameId}{Game identifier, unique} \item{playId}{Play identifier, not
#'   unique across games} \item{playDescription}{Description of play}
#'   \item{quarter}{Game quarter} \item{down}{down} \item{yardsToGo}{Distance
#'   needed for a first down} \item{possessionTeam}{Team
#'   punting, placekicking or kicking off the ball}
#'   \item{specialTeamsPlayType}{Formation of play: Extra Point, Field Goal,
#'   Kickoff or Punt} \item{specialTeamsResult}{Special Teams outcome of play
#'   dependent on play type: Blocked Kick Attempt, Blocked Punt, Downed, Fair
#'   Catch, Kick Attempt Good, Kick Attempt No Good, Kickoff Team Recovery,
#'   Muffed, Non-Special Teams Result, Out of Bounds, Return or Touchback}
#'   \item{kickerId}{nflId of placekicker, punter or kickoff specialist on play}
#'   \item{returnerId}{nflId(s) of returner(s) on play if there was a special
#'   teams return. Multiple returners on a play are separated by a}
#'   \item{kickBlockerId}{nflId of blocker of kick on play if there was a
#'   blocked field goal or blocked punt} \item{yardlineSide}{3-letter team code
#'   corresponding to line-of-scrimmage} \item{yardlineNumber}{Yard line at
#'   line-of-scrimmage} \item{gameClock}{Time on clock of play}
#'   \item{penaltyCodes}{ NFL categorization of the penalties that occurred on
#'   the play. A standard penalty code followed by a d means the penalty was on
#'   the defense. Multiple penalties on a play are separated by a}
#'   \item{penaltyJerseyNumbers}{Jersey number and team code of the player
#'   committing each penalty. Multiple penalties on a play are separated by a }
#'   \item{penaltyYards}{yards gained by possessionTeam by penalty}
#'   \item{preSnapHomeScore}{Home score prior to the play}
#'   \item{preSnapVisitorScore}{Visiting team score prior to the play}
#'   \item{passResult}{Scrimmage outcome of the play if specialTeamsPlayResult
#'   is "Non-Special Teams Result" (C: Complete pass, I: Incomplete pass, S:
#'   Quarterback sack, IN: Intercepted pass, R: Scramble, ' ': Designed Rush,
#'   text)} \item{kickLength}{Kick length in air of kickoff, field goal or punt}
#'   \item{kickReturnYardage}{Yards gained by return team if there was a return
#'   on a kickoff or punt} \item{playResult}{Net yards gained by the kicking
#'   team, including penalty yardage} \item{absoluteYardlineNumber}{Location of
#'   ball downfield in tracking data coordinates} }
#' @source \url{https://www.kaggle.com/c/nfl-big-data-bowl-2022/data}
"PLAYS"

#' Contains data on players.
#'
#' A dataset containing the information on players such as name, height, weight,
#' date of birth etc.
#'
#' @format A data frame with 2732 rows and 7 variables: \describe{
#'   \item{nflId}{Player identification number, unique across players}
#'   \item{height}{Player height} \item{weight}{Player weight}
#'   \item{birthDate}{Date of birth (YYYY-MM-DD)} \item{collegeName}{Player
#'   college} \item{Position}{Player position} \item{displayName}{Player
#'   name} }
#' @source \url{https://www.kaggle.com/c/nfl-big-data-bowl-2022/data}
"PLAYERS"

#' Contains data on scouting information
#'
#' A dataset containing play-level scouting information for each game.
#'
#' @format A data frame with 19979 rows and 20 variables: \describe{
#'   \item{gameId}{Game identifier, unique} \item{playId}{Play identifier, not
#'   unique across games} \item{snapDetail}{On Punts, whether the snap was on
#'   target and if not, provides detail (H: High, L: Low, <: Left, >: Right, OK:
#'   Accurate Snap, text)}\item{snapTime}{Time of the snap}
#'   \item{operationTime}{Timing from snap to kick on punt plays in seconds: }
#'   \item{hangTime}{Hangtime of player's punt or kickoff attempt in seconds.
#'   Timing is taken from impact with foot to impact with the ground or a
#'   player. (numeric)} \item{kickType}{Kickoff or Punt Type. Possible values
#'   for kickoff plays:,D: Deep - your normal deep kick with decent hang time,F:
#'   Flat - different than a Squib in that it will have some hang time and no
#'   roll but has a lower trajectory and hang time than a Deep kick off,K: Free
#'   Kick - Kick after a safety,O: Obvious Onside - score and situation dictates
#'   the need to regain possession. Also the hands team is on for the returning
#'   team,P: Pooch kick - high for hangtime but not a lot of distance - usually
#'   targeting an upman,Q: Squib - low-line drive kick that bounces or rolls
#'   considerably, with virtually no hang time,S: Surprise Onside - accounting
#'   for score and situation an onsides kick that the returning team doesn’t
#'   expect. Hands teams probably aren't on the field,B: Deep Direct OOB -
#'   Kickoff that is aimed deep (regular kickoff) that goes OOB directly
#'   (doesn't bounce),Possible values for punt plays:,N: Normal - standard punt
#'   style,R: Rugby style punt,A: Nose down or Aussie-style punts}
#'   \item{kickDirectionIntended}{Intended kick direction from the kicking
#'   team's perspective - based on how coverage unit sets up and other factors
#'   (L: Left, R: Right, C: Center, text).} \item{kickDirectionActual}{Actual
#'   kick direction from the kicking team's perspective (L: Left, R: Right, C:
#'   Center, text).} \item{returnDirectionIntended}{The return direction the
#'   punt return or kick off return unit is set up for from the return team's
#'   perspective (L: Left, R: Right, C: Center, text).}
#'   \item{returnDirectionActual}{Actual return direction from the return team's
#'   perspective (L: Left, R: Right, C: Center, text).}
#'   \item{missedTackler}{Jersey number and team code of player(s) charged with
#'   a missed tackle on the play. It will be reasonable to assume that he should
#'   have brought down the ball carrier and failed to do so. This situation does
#'   not have to entail contact, but it most frequently does. Missed tackles on
#'   a QB by a pass rusher are also included here. Multiple missed tacklers on a
#'   play are separated by a } \item{assistTackler}{Jersey number and team code
#'   of player(s) assisting on the tackle. Multiple assist tacklers on a play
#'   are separated by a} \item{tackler}{Jersey number and team code of player
#'   making the tackle} \item{kickoffReturnFormation}{3 digit code indicating
#'   the number of players in the Front Wall, Mid Wall and Back Wall}
#'   \item{gunners}{Jersey number and team code of player(s) lined up as gunner
#'   on punt unit. Multiple gunners on a play are separated by a}
#'   \item{puntRushers}{Jersey number and team code of player(s) on the punt
#'   return unit with "Punt Rush" role for actively trying to block the punt.
#'   Does not include players crossing the line of scrimmage to engage in punt
#'   coverage players in a "Hold Up" role. Multiple punt rushers on a play are
#'   separated by a} \item{specialTeamsSafeties}{Jersey number and team code for
#'   player(s) with "Safety" roles on kickoff coverage and field goal/extra
#'   point block units - and those not actively advancing towards the line of
#'   scrimmage on the punt return unit. Multiple special teams safeties on a
#'   play are separated by a} \item{vises}{Jersey number and team code for
#'   player(s) with a "Vise" role on the punt return unit. Multiple vises on a
#'   play are separated by a} \item{kickContactType}{Detail on how a punt was
#'   fielded, or what happened when it wasn't fielded. Possible values: BB:
#'   Bounced Backwards,BC: Bobbled Catch from Air,BF: Bounced Forwards,BOG:
#'   Bobbled on Ground,CC: Clean Catch from Air,CFFG: Clean Field From
#'   Ground,DEZ: Direct to Endzone,ICC: Incidental Coverage Team Contact,KTB:
#'   Kick Team Knocked Back,KTC: Kick Team atch,KTF: Kick Team Knocked
#'   Forward,MBC: Muffed by Contact with Non-Designated Returner,MBDR: Muffed by
#'   Designated Returner,OOB: Directly Out Of Bounds} }
#' @source \url{https://www.kaggle.com/c/nfl-big-data-bowl-2022/data}
"PFFScoutingData"
