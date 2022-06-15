# Preface {#preface .unnumbered}

## Prerequisites


```r
R.version.string
## [1] "R version 4.2.0 (2022-04-22 ucrt)"
```


```python
print(sys.version)
## 3.10.5 (tags/v3.10.5:f377153, Jun  6 2022, 16:14:13) [MSC v.1929 64 bit (AMD64)]
```


```r
# Attached (Basic) Packages in R 
sessionInfo()
## R version 4.2.0 (2022-04-22 ucrt)
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
## [1] fontawesome_0.2.2 reticulate_1.25   knitr_1.39        conflicted_1.1.0 
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_1.0.8.3    rstudioapi_0.13 magrittr_2.0.3  xml2_1.3.3     
##  [5] downlit_0.4.0   lattice_0.20-45 here_1.0.1      R6_2.5.1       
##  [9] rlang_1.0.2     fastmap_1.1.0   stringr_1.4.0   tools_4.2.0    
## [13] grid_4.2.0      xfun_0.31       png_0.1-7       cli_3.3.0      
## [17] jquerylib_0.1.4 htmltools_0.5.2 yaml_2.3.5      digest_0.6.29  
## [21] rprojroot_2.0.3 bookdown_0.25   Matrix_1.4-1    fs_1.5.2       
## [25] sass_0.4.1      memoise_2.0.1   cachem_1.0.6    evaluate_0.15  
## [29] rmarkdown_2.14  stringi_1.7.6   compiler_4.2.0  bslib_0.3.1    
## [33] jsonlite_1.8.0
```


```python
# Imported (Basic) Modules in Python 
allmodules = [v.__name__ for k, v in globals().items() 
    if type(v) is types.ModuleType and not k.startswith('__')]
len(allmodules)
## 7
", ".join(allmodules)
## 'sys, os, pip, copy, types, pandas, numpy'
```

