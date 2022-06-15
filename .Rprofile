# #[2] Dot "./.Rprofile" #NO Auto-Execution, sourced and run by [1] on Restart by "^+F10" "AHK F5"#

# [1] Tilde: Sys.getenv("HOME")
# [2] Dot  : Working Directory - Project specific .Rprofile under GIT management
# This file is copied by SetRProject.ps1 from D:\Analytics\PowerShell\RFiles

# #Set a CRAN mirror. Change the Target URL to the one having 'https' to avoid warnings.
local({r <- getOption("repos")
       r["CRAN"] <- "https://cloud.r-project.org/"
       options(repos=r)})

# #Modify Library Path
# #Note that only directories that exist at the time will be included.
# #It needs modified libPaths for accessing ALL Packages during New Startup. However...
# #Any change in libPaths at [1] earlier gets overwritten here [2]
if (!identical(.libPaths()[1], "C:/Softwares/R/LibFiles")) {
  .libPaths( c( "C:/Softwares/R/LibFiles", .libPaths()) )
}

# #To only download binaries and avoid 'latest code' type Errors in Windows.
# #"There is a binary version available (and will be installed) but the source version is later"
# #i.e. The package has updated recently on CRAN but the binary is not yet available for your OS.
options(pkgType = "binary")

# #Disable Scientific Notation because p-values, residuals etc. are irritating to convert
# #It might show many trailing zeroes but that can be handled separately.
#options(scipen = 0, digits = 7) #Default
options(scipen = 999)

# #Maximum Print Limit (Not lines, Characters. So, higher number is used.)
options(max.print=1000)

# #Set NPP as the external editor
options(editor = "C:/Program Files (x86)/Notepad++/notepad++.exe")

# #Change Prompt
options(prompt="> ")

# #Change the continuity prompt from (+), like (>), to wider (...) like Python
options(continue="... ")

# #Setup Max Width
options(width = 100)

# #Avoid GUI Dialogs in R (as implemented in RStudio)
options(menu.graphics=FALSE)

# #Form Feed Character (="\f" ="\014" ="^l") To suppress R Welcome Message (works for RStudio)
cat("\f")

# #Instruct R to, before anything else, echo a timestamp to the console and to '.Rhistory'
# #Load "utils" package for Sys.time()
library("utils")
.First <- function(){
  if(interactive()){
    message("# ### \"", getwd(), "\" ", Sys.time(), " #")
  }
}

# #tidyverse lifecycle package, to convert deprecated warnings to errors
options(lifecycle_verbosity = "error")

# #Warning: To upgrade Warning to Error for easy identification of problem chunk
# #Restore default: options(warn=0, error=NULL)
if(FALSE) options(warn = 2, error = recover)
