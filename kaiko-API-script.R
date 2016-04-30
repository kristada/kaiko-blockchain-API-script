library(RJSONIO)
library(data.table)
library(pbapply)

#### set path
setwd("/your/path/here")

#### set your repo
#R_repo <- "http://cran.csiro.au/"
R_repo <- "http://your/R/repo/"

libs <- list("RJSONIO", "data.table", "pbapply")

invisible(lapply(libs, function(x){
        result <- library(x, logical.return=T, character.only =T)
        if(result == F) install.packages(x, repos=R_repo)
        library(x, character.only =T)
}))


kaiko_url <- "https://api.kaiko.com/v1/blocks/"
kaiko_tx_url <- "https://api.kaiko.com/v1/transactions/"


flatten_list_func <- function(x){
        block_data_list_0 <- fromJSON(paste0(kaiko_url, x))
        tx_data_list_0 <- fromJSON(paste0(kaiko_tx_url, block_data_list_0$transactions[[1]]$hash))
        
        #### script_hex can be converted to ASCII for coinbase signature
        script_hex <- tx_data_list_0$inputs[[1]]$script_hex
        
        #### note - only records the first address if 
        #### there are more than one generation addresses
        generationAddress <- tx_data_list_0$outputs[[1]]$addresses[1]
        
        data_list_1 <- llply(block_data_list_0,  function(y) y[[1]])
        data_table_0 <- data.table(do.call(cbind, llply(data_list_1, function(x) x[[1]])))
        data_table_1 <- data_table_0[ , list(height, hash, size, branch, reward, fees, 
                                value, difficulty, total_out, tx_hash = transactions, 
                                generationAddress=generationAddress, script_hex=script_hex)]
                      
        
        return(data_table_1)
        
}

blocks_requested <- 409320:409330

kaiko_dt <- rbindlist(pbsapply(blocks_requested, flatten_list_func, simplify=F))

write.csv(kaiko_dt, "kaiko_api.csv")

