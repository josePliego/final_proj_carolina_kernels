Carolina Kernels - Final Project
================

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

Andrew Amore & Jose Pliego & Jaskaran Singh & Joon Sup Park

``` r
library(carolinaKernels)
# carolinaKernels::run_app()
```

The Carolina Kernels are proud to introduce an exploratory analysis tool
built using RShiny to investigate special teams NFL data.

Every Sunday the NFL, through its Next Gen Stats (NGS) initiative,
collects mountains of player data. Each year, the organization releases
portions of this archive as part of an annual analytics competition
coined the “Big Data Bowl”.

This year participants were asked to investigate special teams play. For
those unfamiliar with North American football, four distinct play types
compose special teams: kickoffs, punts, extra points, and field goals.
Kickoffs and punts transition possession from one team to another, while
extra points and field goals involve scoring points by kicking the ball
thru a goal (post).

Each team has different sets of players involved in special teams
functions which are different than regular offensive and defensive
rosters. Included in the NFL’s data dump was scouting information,
player movement for all special teams plays between 2018-2020, and
metadata corresponding to each play (time of game, outcome, team, etc.).

Our final application allows users to explore various summary statistics
for each of the play types and view actual animations for each distinct
play outcome built from the player movement file. Download and install
to begin exploring our product.

For detailed documentation, install the package and run:
`vignette("carolinaKernels")`.
