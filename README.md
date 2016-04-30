---
author: "organofcorti"
date: "30 April 2016"
---

This [R](http://r-project.org) script scrapes and flattens blockchain variable data from kaiko.com into a data.table and a .csv file.

# Before running script:
1. Make sure you enter your working directory at 
setwd("/your/path/here")
and preferred R repo in
R_repo <- "http://your/R/repo/"

The output table will contain fields for the following variables:
"height", "size", "hash" , "branch", "reward", "fees", "value", "difficulty", "total_out", "tx_hash", "generationAddress", "script_hex"  

Check http://docs.kaiko.com/ for more information.


