if (!("conflicted" %in% (.packages()))) {
  pkg <- character(0)
  pkg <- c(pkg, "conflicted", "knitr", "reticulate", "fontawesome")
  
  lapply(pkg, FUN = function(x) {suppressMessages(library(x, character.only = TRUE))})
  
  # Set Precedence
  # dplyr::filter | stats::filter
  #invisible(suppressMessages(conflict_prefer("filter", "dplyr")))
  
  rm(pkg)
  
  # Provide the path to the specific Python binary.
  use_python("C:\\Softwares\\Python\\Python310\\python.exe", required = TRUE)

} else print("R Packages not loaded again.")
