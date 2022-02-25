
#'
#' Convert hiragana to katakana
#' @param x a string (contains hiragana)
#' @return a string where all hiraganas are substituted into katakanas
#' @importFrom stringr str_length
hiragana2katakana <- function(x) {
    r <- c()
    for (i in 1:str_length(x)) {
        ch <- substr(x,i,i)
        k <- match(ch,H2K_TBL$Hira)
        if (!is.na(k)) {
            r <- c(r,H2K_TBL$Kata[k])
        } else {
            r <- c(r,ch)
        }
    }
    paste(r,collapse="")
}