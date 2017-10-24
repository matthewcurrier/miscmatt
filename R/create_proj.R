# source("R/functions.R")

create_proj <- function() {
  dir.create("R")
  dir.create("data")
  dir.create("doc")
  dir.create("figs")
  dir.create("output")
  file.create("01-load.R")
  file.create("02-munge.R")
}