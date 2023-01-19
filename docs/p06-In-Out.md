# Import - Export {#in-out-p06}



## Test DataFrame

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
nn <- 4L
df_r <- data.frame(INT = 1:nn, NUM = seq(1-1, nn-1, 1), 
                   CHR = letters[1:nn], LGL = {1:nn %% 2} == 0)
str(df_r)
## 'data.frame':	4 obs. of  4 variables:
##  $ INT: int  1 2 3 4
##  $ NUM: num  0 1 2 3
##  $ CHR: chr  "a" "b" "c" "d"
##  $ LGL: logi  FALSE TRUE FALSE TRUE
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
nn = 4
df_y = pd.DataFrame({'INT': [i+1 for i in range(nn)], 
      'NUM': np.arange(0.0, nn),
      'CHR': [chr(i) for i in range(ord('a'), ord('a') +nn)],
      'LGL': [i % 2 == 1 for i in range(nn)]})
df_y.info(memory_usage = False)
## <class 'pandas.core.frame.DataFrame'>
## RangeIndex: 4 entries, 0 to 3
## Data columns (total 4 columns):
##  #   Column  Non-Null Count  Dtype  
## ---  ------  --------------  -----  
##  0   INT     4 non-null      int64  
##  1   NUM     4 non-null      float64
##  2   CHR     4 non-null      object 
##  3   LGL     4 non-null      bool   
## dtypes: bool(1), float64(1), int64(1), object(1)
```

</div><br></div>





## CSV

- R `write.csv()` & `read.csv()` are available in R. However `{readr}` package provides faster  `readr::write_csv()` & `readr::read_csv()` methods
- Python [pandas](https://pypi.org/project/pandas) module has [to_csv()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.to_csv.html) & [read_csv()](https://pandas.pydata.org/docs/reference/api/pandas.read_csv.html)
- Note: If rows have different number of columns `JSON` would be a better choice compared to `CSV` 

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
loc <- 'data/R_01_readr.csv'                                #PATH
readr::write_csv(df_r, file = loc)                          #To CSV

aa <- readr::read_csv(loc, show_col_types = FALSE, 
              col_types = list(INT = readr::col_integer(), NUM = col_double(), 
                               CHR = col_character(), LGL = col_logical()))
attr(aa, 'spec') <- NULL                                    #Drop Attribute
if(nrow(readr::problems(aa)) == 0L) attr(aa, 'problems') <- NULL
stopifnot(identical(df_r, as.data.frame(aa)))
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
loc = 'data/Y_01_pandas.csv'                                #PATH
df_y.to_csv(loc, index = False)                             #To CSV

if 'pp' in globals(): del pp
pp = pd.read_csv(loc, dtype = {'INT': np.int64, 'NUM': float, 
                               'CHR': object, 'LGL': bool})
assert(df_y.equals(pp))
```

</div><br></div>





## R RDS

- R `saveRDS()` & `readRDS()` are available in R. However `{readr}` package provides faster  `readr::write_rds()` & `readr::read_rds()` methods
- Python needs [rpy2](https://pypi.org/project/rpy2) module which is unavailable in Windows

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
loc <- 'data/R_01_readr.rds'                                #PATH
readr::write_rds(df_r, file = loc)                          #To RDS

aa <- readr::read_rds(loc)
stopifnot(identical(df_r, aa))
```

</div><br></div>

## Python Arrow Feather

- Python [pyarrow](https://pypi.org/project/pyarrow) module has [write_feather()](https://arrow.apache.org/docs/python/generated/pyarrow.feather.write_feather.html) & [read_feather()](https://arrow.apache.org/docs/python/generated/pyarrow.feather.read_feather.html)
- Pandas itself has moved away from `pickle` (& `msgpack`) to `pyarrow`
- Note: Within `{reticulate}` environment, due to the conflict between Python [pyarrow](https://pypi.org/project/pyarrow) module and R `{arrow}` package, the R package is not being used for now.

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
loc = 'data/Y_01_pyarrow.feather'                           #PATH
pyarrow.feather.write_feather(df_y, loc)                    #To Feather

if 'pp' in globals(): del pp
pp = pyarrow.feather.read_feather(loc)
assert(df_y.equals(pp))
```

</div><br></div>

## R Dump

- R `dump()` creates `.R` file with the `structure()` of all the objects passed to it. This file can be sourced by `source()`. 
- Unlike `saveRDS()` multiple objects can be saved. 
- Caution: It also saves 'object names' thus it may overwrite already existing ones.

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r
loc <- 'data/R_01_dump.r'
dump(c('aa'), file = loc)                                   #To R File
rm(aa)
source(loc)                                                 #Source
stopifnot(all(exists('aa'), identical(df_r, aa)))
```

</div><br></div>

## Python Pickle & HDF5

::: {.rmdcaution}

Python [pickle](https://docs.python.org/3/library/pickle.html) module can be used to save python objects. However, it is unsecure and  arbitrary code execution is possible [(Pickle Flaws)](https://nedbatchelder.com/blog/202006/pickles_nine_flaws.html). 
Pandas uses pickle (via PyTables) for reading and writing `HDF5` files. So avoid this too. [Caution](https://pandas.pydata.org/docs/user_guide/io.html#io-hdf5)

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
if(False):
    # Avoid Pickle
    loc = 'data/Y_01_pickle.pkl'
    df_y.to_pickle(loc)                                     #To Pickle
    
    if 'pp' in globals(): del pp
    pp = pd.read_pickle(loc)
    assert(df_y.equals(pp))

```

</div><br></div>
:::

## Clipboard

- R `read.delim()` is available. However `{readr}` package provides easier `readr::read_delim()` using  `readr::clipboard()` method
- Python [pandas](https://pypi.org/project/pandas) module has [read_clipboard()](https://pandas.pydata.org/docs/reference/api/pandas.read_clipboard.html)

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE) print(df_r)         #Inconsistent separator
cat(readr::format_csv(df_r))  #Output without '#' for easy copy to clipboard
INT,NUM,CHR,LGL
1,0,a,FALSE
2,1,b,TRUE
3,2,c,FALSE
4,3,d,TRUE

if(FALSE) {
  aa <- readr::read_delim(clipboard())            #PATH: 'data/R_01_readr.csv'
  aa$INT <- as.integer(aa$INT)
  attr(aa, 'spec') <- NULL
  if(nrow(readr::problems(aa)) == 0L) attr(aa, 'problems') <- NULL
  stopifnot(identical(df_r, as.data.frame(aa)))
  dput(aa)
}
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
print(df_y)                   #Output without '#' for easy copy to clipboard
   INT  NUM CHR    LGL
0    1  0.0   a  False
1    2  1.0   b   True
2    3  2.0   c  False
3    4  3.0   d   True
if(False):
    if 'pp' in globals(): del pp
    pp = pd.read_clipboard()                      #PATH: 'data/Y_01_pandas.csv'
    pp['NUM'] = pp['NUM'].astype('float64')
    pp.info(memory_usage = False)
    assert(df_y.equals(pp))
    print(pp)
```

</div><br></div>

## Scripts .r & .py

- R has `writeLines()`, `file.exists()`, `file.remove()` & other related functions for file operations and `source()` to execute `.r` scripts
- Python has [open()](https://docs.python.org/3/library/functions.html#open), [with()](https://docs.python.org/3/reference/compound_stmts.html#the-with-statement), [exists()](https://docs.python.org/3/library/os.path.html#os.path.exists), [remove()](https://docs.python.org/3/library/os.html#os.remove)

- Note: Script execution is similar in R and Python i.e. On Error, next line is not executed. However, Chunk execution is different i.e. in the R chunk next line is not executed whereas in the Python chunk it will be executed even after Error is thrown. 
  - Thus, in R chunk, `stopifnot(FALSE)` is enough to stop chunk execution 
  - Whereas, in Python, `assert(False)`, `exit(1)`, `quit(1)`, `sys.exit(1)`, `raise SystemExit` do not prevent further execution 
  - On the other hand `os._exit(1)` not only quits the Python but also the R session. So, this should be avoided.

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE){# Avoid writing executable scripts to directories
  loc <- 'data/R_02_script.r'
  txt <- "stopifnot(TRUE) # Execution stops on ERROR\nprint('Hello')"
  writeLines(txt, loc)                            #Create R Script
  source(loc)                                     #Source R Script
  if(file.exists(loc)) file.remove(loc)           #Delete with no recovery  
}
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
if(False): # Avoid writing executable scripts to directories
    loc = 'data/Y_02_script.py'
    with open(loc, 'w') as f:
        f.write("assert(True) # Execution stops on ERROR\nprint('Hello')")
    exec(open(loc).read())                        #Execute Python Script
    if(os.path.exists(loc)): os.remove(loc)
```

</div><br></div>

## Standard Datasets 

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
data(package = 'dplyr')$results[ , 'Item']        #Load or List Datasets
## [1] "band_instruments"  "band_instruments2" "band_members"     
## [4] "starwars"          "storms"

dim(dplyr::storms)
## [1] 11859    13

loc <- 'data/R_03_iris.rds'                                 #PATH
if(!exists(loc)) {# Headers | Replace '.' by '_' | To lowercase 
    aa <- datasets::iris |> rename_with(make.names) |> 
      rename_with(~ tolower(gsub('.', '_', .x, fixed = TRUE)))
    readr::write_rds(aa, file = loc)                        #Dataset: Iris
} else {
    aa <- readr::read_rds(loc) 
}

str(aa, vec.len = 2)
## 'data.frame':	150 obs. of  5 variables:
##  $ sepal_length: num  5.1 4.9 4.7 4.6 5 ...
##  $ sepal_width : num  3.5 3 3.2 3.1 3.6 ...
##  $ petal_length: num  1.4 1.4 1.3 1.5 1.4 ...
##  $ petal_width : num  0.2 0.2 0.2 0.2 0.2 ...
##  $ species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 ...
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
loc = 'data/Y_03_iris.feather'                              #PATH
if(not os.path.exists(loc)):
    pp = sns.load_dataset('iris')                           #Needs Internet
    list(pp.columns) 
    #['sepal_length', 'sepal_width', 'petal_length', 'petal_width', 'species']
    qq = sm.datasets.get_rdataset('iris').data              #Needs Internet
    qq.columns = pp.columns
    #dir(sklearn.datasets)                                  #All Datasets
    ss = sklearn.datasets.load_iris(as_frame = True).data   #Offline, No Target
    tt = sklearn.datasets.load_iris()                       #Offline, Bunch
    uu = pd.DataFrame(data = np.c_[tt['data'], tt['target']],
          columns = tt['feature_names'] + ['target']).astype({'target': int}) \
          .assign(species = lambda x: x['target'].map(
                            dict(enumerate(tt['target_names'])))) \
          .drop('target', axis = 1)
    uu.columns = pp.columns
    assert(uu.equals(pp) and uu.equals(qq))
    pyarrow.feather.write_feather(uu, loc)                  #Dataset: Iris
else:
    uu = pyarrow.feather.read_feather(loc)


uu.info(memory_usage = False)
## <class 'pandas.core.frame.DataFrame'>
## RangeIndex: 150 entries, 0 to 149
## Data columns (total 5 columns):
##  #   Column        Non-Null Count  Dtype  
## ---  ------        --------------  -----  
##  0   sepal_length  150 non-null    float64
##  1   sepal_width   150 non-null    float64
##  2   petal_length  150 non-null    float64
##  3   petal_width   150 non-null    float64
##  4   species       150 non-null    object 
## dtypes: float64(4), object(1)
```

</div><br></div>







