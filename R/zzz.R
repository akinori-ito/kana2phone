.onLoad <- function(libname,pkgname) {
  if (.Platform$OS.type == "windows") {
    K2P_TBL$kana <- iconv(K2P_TBL$kana,from="UTF-8",to="SHIFT_JIS")
    H2K_TBL$Hira <- iconv(H2K_TBL$Hira,from="UTF-8",to="SHIFT_JIS")
    H2K_TBL$Kata <- iconv(H2K_TBL$Kata,from="UTF-8",to="SHIFT_JIS")
  }
}

