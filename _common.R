# Attach (Basic) Packages in R 
sys.source('./code/Packages.R', envir = knitr::knit_global())

# Provide the path to the specific Python binary
reticulate::use_python('C:\\Softwares\\Python\\Python310\\python.exe', required = TRUE)

# Import (Basic) Modules in Python 
reticulate::source_python('./code/Modules.py', convert = FALSE)

# Load Helper Functions in R 
sys.source('./code/Functions.R', envir = knitr::knit_global())

# R options set globally
options(width = 80)

# Chunk options set globally
knitr::opts_chunk$set(
  #comment = '#>',
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
  
  # The Standard, Wider, and Higher Plot Sizes
  q_png_h <- 7
  q_png_w <- 7
  q_png_w_w <- 2 * q_png_w
  q_png_w_h <- {9/16} * q_png_w_w
  q_png_h_h <- {3/4} * 2 * q_png_h
  q_png_h_w <- 2 * q_png_w
  q_dpi <- q_dpi_w <- q_dpi_h <- 300
}

if(TRUE){# Chunk Decoration based on Language Engine: R & Python
  # NOTE: Global Chunk Option setup leads to problem with chunks like 'definition' etc.
  knitr::knit_hooks$set(decorate = function(before, options) {
    if (before) {
      q_engine <- options$engine
      #q_eng_v  <- c('R', 'python')
      #if (q_engine %in% q_eng_v) {
        if (q_engine == 'python') {
            label <- '<b> Python</b>'
            bc <- 'inherit' #'#417FB1'
            sz <- '100%'
            tc <- '#FFD94C'
            icon <- fa('python', fill = tc)
        } else if (q_engine == 'R') {
            label <- '<b> R</b>'
            bc <- 'inherit' #'#4C78DB'
            sz <- '100%'
            #tc <- '#ffffff'
            tc <- '#4C78DB'
            icon <- fa('r-project', fill = tc)
        } #else if (options$engine == 'bash') {
        #    label <- '<b>Shell</b>'
        #    bc <- '#000000'
        #    sz <- '100%'
        #    tc <- '#ffffff'
        #    icon <- '<i class=\'fas fa-terminal\'></i>'
        #}
        paste0('<div class=decocode>', '<div style=\'background-color:', 'inherit',
               '\'>', '<span style=\'font-size:', sz, ';color:', tc, '\'>', icon, label, '</span>')
      #}
    } else {
        '</div><br></div>'
    }
  })
}
