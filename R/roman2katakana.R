#'
#' Convert romaji to katakana
#' @param rom a string (romaji)
#' @return a string where all romaji are substituted into katakanas
#' @importFrom stringr str_length
#' @export
roman2katakana <- function(rom) {
  state <- 1
  out <- c()
  for (i in 1:str_length(rom)) {
    ch <- substr(rom,i,i)
    r <- R2K_TBL[[state]]
    if (ch %in% names(r)) {
      rr <- r[[ch]]
      if (str_length(rr$output) > 0) {
        out <- c(out,rr$output)
      }
      state <- rr$nextstate
    } else {
      if (state == 10) {
        # 'n' remains
        out <- c(out,NN)
      }
      out <- c(out,ch)
      state <- 1
    }
  }
  if (state == 10) {
    # 'n' remains
    out <- c(out,NN)
  }
  paste(out,collapse="")
}

### preparation (comment on commit)
# library(dplyr)
# library(openxlsx)
# x <- read.xlsx("../state.xlsx")
# x$output[is.na(x$output)] <- ""
# R2K_TBL<-list()
# for (st in 1:(max(x$state)+1)) {
#   R2K_TBL[[st]] <- list()
# }
# for (i in 1:nrow(x)) {
#   st <- x$state[i]+1
#   input <- x$input[i]
#   R2K_TBL[[st]][[input]]<-list(output=x$output[i],nextstate=x$nextstate[i]+1)
# }
# xx <- dplyr::filter(x,state==9,input=="n")
# NN <- xx$output
# save(R2K_TBL,NN,file="../data/R2K_TBL.rda")