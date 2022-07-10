if (!("conflicted" %in% (.packages()))) {
  pkg <- character(0)
  pkg <- c(pkg, "conflicted", "knitr", "reticulate", "fontawesome")
  pkg <- c(pkg, "lobstr", "tibble", "dplyr", "here", "readr")
  
  lapply(pkg, FUN = \(x) library(x, character.only = TRUE))
  
  # Set Precedence
  # dplyr::filter | stats::filter
  #invisible(suppressMessages(conflict_prefer("filter", "dplyr")))
  
  rm(pkg)

} else print("R Packages not loaded again.")
