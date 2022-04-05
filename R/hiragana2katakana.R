
#'
#' Convert hiragana to katakana
#' @param x a string (contains hiragana)
#' @return a string where all hiraganas are substituted into katakanas
#' @importFrom stringr str_length
#' @export
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

#'
#' Convert katakana to hiragana
#' @param x a string (contains katakana)
#' @return a string where all katananas are substituted into hiraganas
#' @importFrom stringr str_length
#' @export
katakana2hiragana <- function(x) {
    r <- c()
    for (i in 1:str_length(x)) {
        ch <- substr(x,i,i)
        k <- match(ch,H2K_TBL$Kata)
        if (!is.na(k)) {
            r <- c(r,H2K_TBL$Hira[k])
        } else {
            r <- c(r,ch)
        }
    }
    paste(r,collapse="")
}
