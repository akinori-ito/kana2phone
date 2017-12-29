# かな表記を音素表記の配列に変換

# 音素体系
# 
# silB silE
# N a a: i i: u u: e e: o o:
# w y
# b by ch d f g gy h hy j k ky m my n ny p py q r ry s sh t ts z


#K2P_TBL <- read.csv("kanaphone.csv",as.is=T,fileEncoding="UTF-8")

#' Convert a kana string to a phone vector
#' @param str a katakana string
#' @importFrom stringr str_length
#' @importFrom stringr str_split
#' @export
#'
kana2phone <- function(str) {
    res <- c()
    i <- 1
    while (i <= str_length(str)) {
      ch <- substr(str,i,i)
      i <- i+1
      if (i > 1  && 
	      substr(str,i,1) %in% c("ァ","ィ","ゥ","ェ","ォ","ャ","ュ","ョ")) {
         ch <- substr(str,i-1,i)
         i <- i+1
      }
      p <- match(ch,K2P_TBL$kana)
      if (is.na(p)) {
         stop(paste("Can't convert",ch,"into phonemes"))
      }
      p <- K2P_TBL$phone[p]
      if (i > 1 && substr(str,i,i) == "ー") {
         p <- paste(p, ":", sep="")
         i <- i+1
      }
      res <- c(res,p)
    }
    str_split(paste(res,collapse=" ")," ")[[1]]
}

