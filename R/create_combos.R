create_combos <- function(strings, comb) {
  library(combinat)

  f <- function(x) {
    paste(x, collapse = ", ")
  }

  c <- combn(strings, comb, simplify = T)
  c <- as.data.frame(c, stringsAsFactors=F)
  l <- lapply(c, f)
}
