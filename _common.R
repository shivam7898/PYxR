# Attach (Basic) Packages in R 
sys.source("./code/Packages.R", envir = knitr::knit_global())

# Provide the path to the specific Python binary
reticulate::use_python("C:\\Softwares\\Python\\Python310\\python.exe", required = TRUE)

# Import (Basic) Modules in Python 
reticulate::source_python("./code/Modules.py", convert = FALSE)

# R options set globally
options(width = 80)

# Chunk options set globally
knitr::opts_chunk$set(
  #comment = "#>",
  collapse = TRUE,
  width = 80, 
  opts.label = 'twofig', 
  message = FALSE, 
  warning = FALSE, 
  error = FALSE, 
  progress = FALSE, 
  verbose = FALSE
  )

if(FALSE){# Chunk Templates, use as: opts.label='twofig'
  knitr::opts_template$set(twofig = 
                           list(fig.show = 'hold', fig.align = 'center', out.width = '49%'))
  
  # #The Standard, Wider, and Higher Plot Sizes
  q_png_h <- 7
  q_png_w <- 7
  q_png_w_w <- 2 * q_png_w
  q_png_w_h <- {9/16} * q_png_w_w
  q_png_h_h <- {3/4} * 2 * q_png_h
  q_png_h_w <- 2 * q_png_w
  q_dpi <- q_dpi_w <- q_dpi_h <- 300
}
