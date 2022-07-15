if (FALSE || !("conflicted" %in% (.packages()))) {
  # CAUTION: Due to R "arrow" & Python "pyarrow" conflict do not load it in R
  pkg <- character(0)
  pkg <- c(pkg, "conflicted", "knitr", "reticulate", "fontawesome")
  pkg <- c(pkg, "lobstr", "tibble", "dplyr", "readr", "tidyr")
  
  lapply(pkg, FUN = \(x) library(x, character.only = TRUE))
  
  # Set Precedence
  # dplyr::filter | stats::filter
  #invisible(suppressMessages(conflict_prefer("filter", "dplyr")))
  
  rm(pkg)

} else print("R Packages not loaded again.")
