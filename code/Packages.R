if (!("conflicted" %in% (.packages()))) {
  pkg <- character(0)
  pkg <- c(pkg, "conflicted", "knitr", "reticulate")
  
  lapply(pkg, FUN = function(x) {suppressMessages(library(x, character.only = TRUE))})
  
  # Set Precedence
  # dplyr::filter | stats::filter
  #invisible(suppressMessages(conflict_prefer("filter", "dplyr")))
  
  rm(pkg)

} else print("R Packages not loaded again.")
