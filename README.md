Statisitcal Programming - Final Project
-----------
<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Proposal survey is due by 5:00 pm on Friday, November 19th.

Completed final project is due by 5:00 pm on  Monday, December 13th.

## Guidelines

1. You may form a team of between 1 - 5 students to complete the project.

1. The primary goal of the project is to do something interesting using something related to the course. This is purposefully open ended to give you the opportunity to work on something you are interested in and to produce work that you could potentially show to a prospective employer or use as part of your graduation portfolio.
   
   Some examples of possible topics,
     - Implementing an interface to a Web API (e.g. Spotify, GitHub, etc.)
     - Collecting / assembling a data set via webscraping or similar approach
     - Analyzing a data set 
     - Implementing a specific algorithm from a paper
     - Developing a Shiny app for any of the above
 
 1. The primary way in which you will be evaluate will be based on the evidence of effort in your project and the quality of the write up. What this means is that a "failed" project (e.g. an analysis without a significant result) that is well documented will receive a better grade than a less ambitious "successful" project with a worse write up.

1. Your must complete the project as a self contained R package which contains all the necessary code, data, and documentation. Specifically, your repo should contain the following:
   1. A brief `README.md` that introduces your project.
   2. All R source code should be included in `R/` with important functions documented and exported.
   3. A 5-10 pages write up of your project as a Rmd vignette in `vignettes/`. This write up should provide an introduction and relevant background for your project, detailed documentation on the implementation of your project and a walkthrough / demonstration of the project if relevant.
   4. If relevant, tests should be included in `tests/`, all tests should should pass when run by myself or the TAs.
   5. A properly formatted `DESCRIPTION` file with all relevant package dependencies.
   6. Your package should pass `R CMD check` (Build > Test Package menu in RStudio), i.e. there should be no Errors, Warnings, or Notes.

1. As with all of the other homework assignments in the class, everyone is expected to contribute equally to the final product - there will be a peer evaluation distributed after the assignment is completed to assess this. Failure to sufficiently contribute may result in a penalty to your individual grade.
