# ---------------
# Title: Parentage Matrix
# Date: 17 Nov 2023
# Author: mgranellruiz
# Goal: My goal is to end up with a table that has 1 individual per row and two columns of potential mathers and fathers.
# with the date of birth and possible date of conception
# ---------------

# library ---------------------
library(lubridate)
library(dplyr)
library(ggplot2)
library(lme4)
library(ggstatsplot)
library(fitdistrplus)
library(gamlss)
library(ggside)
library(ggpubr)
library(stringr)
library(gridExtra)
library(ggtext)
library(tidyr)
library(patchwork)
source('/Users/mariagranell/Repositories/data/functions.R')

# path ------------------------
setwd()

# data ------------------------