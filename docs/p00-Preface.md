# Preface {#preface .unnumbered}



## Guidelines

- The project will be kept in sync with the latest versions of both Python and R. 
- It will be ensured that the code can be executed by direct copy-paste and without significantly affecting user work environment
- Equality & Identity tests related to language rules may be hidden to avoid clutter

## References

- [CRAN R Manuals](https://cran.r-project.org/doc/manuals/) or [CRAN Duplicate](https://cran.r-project.org/manuals.html) :
  - [An Introduction to R](https://cran.r-project.org/doc/manuals/R-intro.html)
  - [R Installation and Administration](https://cran.r-project.org/doc/manuals/R-admin.html)
  - [R Data Import/Export](https://cran.r-project.org/doc/manuals/R-data.html)
  - [Writing R Extensions](https://cran.r-project.org/doc/manuals/R-exts.html)
  - [R Internals](https://cran.r-project.org/doc/manuals/R-ints.html)
  - [R Language Definition](https://cran.r-project.org/doc/manuals/R-lang.html)
  - [R FAQ](https://cran.r-project.org/doc/manuals/R-FAQ.html)

- [Python](https://docs.python.org/3/index.html) :
  - [Python Standard Library](https://docs.python.org/3/library/index.html)
  - [Python Language Reference](https://docs.python.org/3/reference/index.html)
  - [Python Tutorial](https://docs.python.org/3/tutorial/index.html)
  - [Python HOWTO](https://docs.python.org/3/howto/index.html)


## Prerequisites

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
strsplit(R.version.string, " ")[[1]][3]           # R Version
## [1] "4.2.1"
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
print(sys.version.split()[0])                     # Python Version
## 3.10.5
```

</div><br></div>

## Environment

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Attached (Basic) Packages in R 
sessionInfo()
## R version 4.2.1 (2022-06-23 ucrt)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 10 x64 (build 19044)
## 
## Matrix products: default
## 
## locale:
## [1] LC_COLLATE=English_India.utf8  LC_CTYPE=English_India.utf8   
## [3] LC_MONETARY=English_India.utf8 LC_NUMERIC=C                  
## [5] LC_TIME=English_India.utf8    
## 
## attached base packages:
## [1] stats     graphics  grDevices datasets  utils     methods   base     
## 
## other attached packages:
## [1] readr_2.1.2       here_1.0.1        dplyr_1.0.9       tibble_3.1.7     
## [5] lobstr_1.1.2      fontawesome_0.2.2 reticulate_1.25   knitr_1.39       
## [9] conflicted_1.1.0 
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_1.0.8.3     jquerylib_0.1.4  bslib_0.3.1      pillar_1.7.0    
##  [5] compiler_4.2.1   tools_4.2.1      downlit_0.4.2    digest_0.6.29   
##  [9] evaluate_0.15    jsonlite_1.8.0   memoise_2.0.1    lifecycle_1.0.1 
## [13] lattice_0.20-45  pkgconfig_2.0.3  png_0.1-7        rlang_1.0.3     
## [17] Matrix_1.4-1     cli_3.3.0        DBI_1.1.3        rstudioapi_0.13 
## [21] yaml_2.3.5       xfun_0.31        fastmap_1.1.0    stringr_1.4.0   
## [25] xml2_1.3.3       withr_2.5.0      fs_1.5.2         sass_0.4.1      
## [29] hms_1.1.1        generics_0.1.3   vctrs_0.4.1      rprojroot_2.0.3 
## [33] grid_4.2.1       tidyselect_1.1.2 glue_1.6.2       R6_2.5.1        
## [37] fansi_1.0.3      rmarkdown_2.14   bookdown_0.27    tzdb_0.3.0      
## [41] purrr_0.3.4      magrittr_2.0.3   ellipsis_0.3.2   htmltools_0.5.2 
## [45] assertthat_0.2.1 utf8_1.2.2       stringi_1.7.6    cachem_1.0.6    
## [49] crayon_1.5.1
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Imported (Basic) Modules in Python 
allmodules = [v.__name__ for k, v in globals().items() 
    if type(v) is types.ModuleType and not k.startswith('__')]

len(allmodules)                                   # Count the Loaded Modules
## 8
", ".join(allmodules)                             # List Modules
## 'sys, os, pip, copy, types, math, pandas, numpy'
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Python Configuration with R Package 'Reticulate'
py_config()
## python:         C:/Softwares/Python/Python310/python.exe
## libpython:      C:/Softwares/Python/Python310/python310.dll
## pythonhome:     C:/Softwares/Python/Python310
## version:        3.10.5 (tags/v3.10.5:f377153, Jun  6 2022, 16:14:13) [MSC v.1929 64 bit (AMD64)]
## Architecture:   64bit
## numpy:          C:/Softwares/Python/Python310/Lib/site-packages/numpy
## numpy_version:  1.23.1
## 
## NOTE: Python version was forced by use_python function
```

</div><br></div>

