# [3] .Rprofile at the ACTIVE Directory and Executed by [2] at Analytics\\R

# Set a CRAN mirror
local({r <- getOption("repos")
       r["CRAN"] <- "https://cloud.r-project.org/"
       options(repos=r)})

# Prepend Path of User Packages (Again, III, & Last)
loc <- "C:\\Softwares\\R\\LibFiles"
if (!identical(.libPaths()[1], loc)) {
    .libPaths(c(loc, .libPaths()))
}
rm(loc)

# To only download binaries and avoid 'latest code' type Errors in Windows.
options(pkgType = "binary")

# Disable Scientific Notation #options(scipen = 0, digits = 7) #Default
options(scipen = 999)

# Maximum Character Print Limit
options(max.print = 1000)

# Change Prompt & Continuity Prompt
options(prompt = "> ")
options(continue = "... ")

# Setup Max Width
options(width = 100)

# Avoid GUI Dialog in R (as implemented in RStudio)
options(menu.graphics = FALSE)

.First <- function(){
    if(interactive()){
        #Before anything else, echo a timestamp to the console and to '.Rhistory'
        message("# ### \"", getwd(), "\" ", Sys.time(), " #")
        setHook("rstudio.sessionInit", function(newSession) {
            #Form Feed Character to suppress R Welcome Message in RStudio
            cat("\f")
            #Echo the timestamp again on RStudio Session Load
            message("# ### \"", getwd(), "\" ", Sys.time(), " #")
            }, action = "append")
    }
}

# tidyverse life-cycle package, to convert deprecated warnings to errors
#Commented on 2022-01-19 because of dplyr::join() 
#vec_equal_na() was deprecated in vctrs 0.5.0.
#Please use vec_detect_missing()
#options(lifecycle_verbosity = "error")

# Warning: To upgrade Warning to Error for easy identification of problem chunk
# Restore default: options(warn = 0, error = NULL)
if(FALSE) options(warn = 2, error = recover)

