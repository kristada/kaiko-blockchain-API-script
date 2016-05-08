---
author: "organofcorti"
date: "30 April 2016"
---

### No longer updated, now bundled into [bitcoin-blockchain-data](https://github.com/organofcorti/bitcoin-blockchain-data)

This [R](http://r-project.org) script scrapes and flattens blockchain variable data from kaiko.com into a data.table and a .csv file.

##### Before running script:
Make sure you enter your working directory:  
```R
setwd("/your/path/here")
```  
and preferred R repo:  
```R
R_repo <- "http://your/R/repo/"
```
    
##### The output table will contain fields for the following variables:
"height", "size", "hash" , "branch", "reward", "fees", "value", "difficulty", "total_out", "tx_hash", "generationAddress", "script_hex"  

Mining pools and other block makers can be identified using the generation address or converting "script_hex" to a coinbase signature.

An example of the output is here: [kaiko_api.csv](https://github.com/organofcorti/kaiko-blockchain-API-script/blob/master/kaiko_api.csv)
  
  
##### Check http://docs.kaiko.com/ for more information.


