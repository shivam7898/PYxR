# Data Frame {#df-p04}



## Basics

> Indexing starts from 1 in R and from 0 in Python.  

R provides `data.frame()` for tabular data structure. `{tibble}` & `{data.table}` are packages which extends its capabilities. Python module [pandas](https://pypi.org/project/pandas) provide similar capabilities

R `data.frame()` is a `list()` of variables of the same number of rows. It is a `matrix()` like structure whose columns may be of differing types. Similarly, Python Pandas [DataFrame()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html) is a 2-dimensional data structure that can store data of different types in columns. 


- Create R `data.frame()`, `tibble::tibble()` and Python [DataFrame()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
nn <- 4L                                          #Number of Rows

# R Data Frame: integer, double, character, logical, factor
df_r <- data.frame(
  INT = 1:nn, NUM = seq(1, nn, 1), CHR = letters[1:nn], LGL = (1:nn %% 2) == 0, 
  FCT = factor(rep(c('No', 'Yes'), length.out = nn)))

# Tibble
tbl <- tibble::tibble(
  INT = 1:nn, NUM = seq(1, nn, 1), CHR = letters[1:nn], LGL = (1:nn %% 2) == 0, 
  FCT = factor(rep(c('No', 'Yes'), length.out = nn)))

stopifnot(all(identical(df_r, as.data.frame(tbl)), 
              identical(tbl, tibble::as_tibble(df_r))))
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = 4                                            #Number of Rows

qq = {'INT': [i+1 for i in range(pp)], 
      'NUM': (float(i+1) for i in range(pp)),
      'CHR': [chr(i) for i in range(ord('a'), ord('a') +pp)],
      'LGL': [i % 2 == 1 for i in range(pp)],
      'FCT': pd.Categorical(['No', 'Yes'] * 2)}

df_y = pd.DataFrame(data = qq)                    #DataFrame from dict
```

</div><br></div>



- Print DataFrame: 
  - R: `print()`, `head()`, `tail()`, `dplyr::slice()`
  - Python: [print()](https://docs.python.org/3/library/functions.html#print), [head()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.head.html), [tail()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.tail.html), [iloc](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.iloc.html)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r
if(FALSE) print(aa)                     #Data Frame prints ALL Rows (Avoid)
if(FALSE) print(tbl, n = 2)             #Tibble can take number of rows to print

stopifnot(identical(dplyr::slice(aa, 1:2), head(aa, 2)))
head(aa, 2)                                       #Subset by Head
##   INT NUM CHR   LGL FCT
## 1   1   1   a FALSE  No
## 2   2   2   b  TRUE Yes

tail(aa, 2)                                       #Subset by Tail
##   INT NUM CHR   LGL FCT
## 3   3   3   c FALSE  No
## 4   4   4   d  TRUE Yes
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = df_y.copy()

assert(pp.head(2).equals(pp.iloc[:2]))
pp.head(2)

##    INT  NUM CHR    LGL  FCT
## 0    1  1.0   a  False   No
## 1    2  2.0   b   True  Yes
pp.tail(2)
##    INT  NUM CHR    LGL  FCT
## 2    3  3.0   c  False   No
## 3    4  4.0   d   True  Yes
```

</div><br></div>

- About DataFrame:
  - R: `class()`, `typeof()`, `dim()`, `names()`, `str()`, `summary()`
  - Python: [type()](https://docs.python.org/3/library/functions.html#type), [shape](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.shape.html), [columns](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.columns.html), [describe()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.describe.html), [dtypes](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.dtypes.html), [info()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.info.html)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r
class(aa)                                         #Class
## [1] "data.frame"

typeof(aa)                                        #Type
## [1] "list"

dim(aa)                                           #Dimensions [Row, Column]
## [1] 4 5

names(aa)                                         #Column Headers
## [1] "INT" "NUM" "CHR" "LGL" "FCT"
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = df_y.copy()

print(type(pp))                                   #Explicitly Print type()

## <class 'pandas.core.frame.DataFrame'>
pp.shape                                          #Dimensions [Row, Column]

## (4, 5)
list(pp.columns)                                  #Column Headers
## ['INT', 'NUM', 'CHR', 'LGL', 'FCT']
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r
str(aa)                                           #Structure
## 'data.frame':	4 obs. of  5 variables:
##  $ INT: int  1 2 3 4
##  $ NUM: num  1 2 3 4
##  $ CHR: chr  "a" "b" "c" "d"
##  $ LGL: logi  FALSE TRUE FALSE TRUE
##  $ FCT: Factor w/ 2 levels "No","Yes": 1 2 1 2

summary(aa)                                       #Summary
##       INT            NUM           CHR               LGL           FCT   
##  Min.   :1.00   Min.   :1.00   Length:4           Mode :logical   No :2  
##  1st Qu.:1.75   1st Qu.:1.75   Class :character   FALSE:2         Yes:2  
##  Median :2.50   Median :2.50   Mode  :character   TRUE :2                
##  Mean   :2.50   Mean   :2.50                                             
##  3rd Qu.:3.25   3rd Qu.:3.25                                             
##  Max.   :4.00   Max.   :4.00
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = df_y.copy()
list(pp.describe().index)                         #(Default) Summary of Num only
## ['count', 'mean', 'std', 'min', '25%', '50%', '75%', 'max']
[x for x in pp.describe(include = 'all').index if x not in pp.describe().index]
## ['unique', 'top', 'freq']
pp.describe(include = 'all').loc[['count', 'max', 'unique']]

##         INT  NUM  CHR  LGL  FCT
## count   4.0  4.0    4    4    4
## max     4.0  4.0  NaN  NaN  NaN
## unique  NaN  NaN    4    2    2
pp.dtypes                                         #data type of each column

## INT       int64
## NUM     float64
## CHR      object
## LGL        bool
## FCT    category
## dtype: object
pp.info(memory_usage = False)                     #Structure
## <class 'pandas.core.frame.DataFrame'>
## RangeIndex: 4 entries, 0 to 3
## Data columns (total 5 columns):
##  #   Column  Non-Null Count  Dtype   
## ---  ------  --------------  -----   
##  0   INT     4 non-null      int64   
##  1   NUM     4 non-null      float64 
##  2   CHR     4 non-null      object  
##  3   LGL     4 non-null      bool    
##  4   FCT     4 non-null      category
## dtypes: bool(1), category(1), float64(1), int64(1), object(1)
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
#Prevent the collapse of middle rows or columns into (...)
if(False):
    with pd.option_context('display.max_rows', None, 
                           'display.max_columns', None):
        print(pp.describe(include = 'all'))
```

</div><br></div>

- Select Columns:
  - R: `[]` (`base::Extract`), `dplyr::select()`, `data.frame()`, `with()`, `subset()` (Avoid)
  - Python: [[]](https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html), [drop()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop.html), [filter()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.filter.html)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r
names(aa)
## [1] "INT" "NUM" "CHR" "LGL" "FCT"

bb <- dplyr::select(aa, 2:3)                                #Select by Position
dd <- select(aa, NUM, CHR)                                  #Select by Name
ee <- select(aa, -c(INT, LGL, FCT))                         #Drop Columns

ff <- data.frame('NUM' = aa$NUM, 'CHR' = aa$CHR)
# with() can be used to create an environment using data
gg <- with(aa, data.frame(NUM, CHR))
# [] is used for subsetting but note that 1-column subset is vector by default
hh <- aa[ , c('NUM', 'CHR'), drop = FALSE]
ii <- subset(aa, select = c(NUM, CHR), drop = FALSE)        #Avoid

stopifnot(all(sapply(list(dd, ee, ff, gg, hh, ii), identical, bb)))
str(bb)
## 'data.frame':	4 obs. of  2 variables:
##  $ NUM: num  1 2 3 4
##  $ CHR: chr  "a" "b" "c" "d"
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = df_y.copy()
list(pp.columns)
## ['INT', 'NUM', 'CHR', 'LGL', 'FCT']
qq = pp[['NUM', 'CHR']].copy()                              #Use List of Names
ss = pp.drop(columns = ['INT', 'LGL', 'FCT']).copy()        #Drop Columns
tt = pp.drop(['INT', 'LGL', 'FCT'], axis = 1).copy()        #0 Rows, 1 Columns
uu = pp.filter(['NUM', 'CHR']).copy()

assert(qq.equals(ss) and qq.equals(tt) and qq.equals(uu))
qq
##    NUM CHR
## 0  1.0   a
## 1  2.0   b
## 2  3.0   c
## 3  4.0   d
```

</div><br></div>

- Rename:
  - R: `names()`, `dplyr::rename()`
  - Python: [rename()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.rename.html), [columns](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.columns.html)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r
names(aa)
## [1] "INT" "NUM" "CHR" "LGL" "FCT"

names(aa)[c(1, 3)] <- c('A', 'C')                 #By Position
names(aa)[names(aa) == 'NUM'] <- 'B'              #By Name

aa <- dplyr::rename(aa, D = LGL, E = 5)           #New = Old (Reverse of Python)
names(aa)
## [1] "A" "B" "C" "D" "E"
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = df_y.copy()
list(pp.columns)

## ['INT', 'NUM', 'CHR', 'LGL', 'FCT']
pp.rename(columns = {'INT': 'A', pp.columns[1]: 'B'}, inplace = True) #Old: New
pp.rename(columns = dict(zip(pp.columns[[3]], ['D'])),inplace = True) #Old, New
pp.columns.values[[2, 4]] = ['C', 'E']

list(pp.columns)
## ['A', 'B', 'C', 'D', 'E']
```

</div><br></div>

- Sort:
  - R: `order()`, `dplyr::arrange()`, `dplyr::desc()`
  - Python: [index](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.index.html)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r

# order() ALWAYS reorders the rownames
bb <- aa[order(aa$CHR, decreasing = TRUE), ]

# arrange() reorders character rownames but reinitialises them from 1 if integer
dd <- dplyr::arrange(aa, dplyr::desc(CHR))
row.names(dd) <- 4:1
stopifnot(identical(bb, dd))
dd
##   INT NUM CHR   LGL FCT
## 4   4   4   d  TRUE Yes
## 3   3   3   c FALSE  No
## 2   2   2   b  TRUE Yes
## 1   1   1   a FALSE  No
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = df_y.copy()
list(pp.index)

## [0, 1, 2, 3]
pp.sort_values('CHR', ascending = False, inplace = True)
list(pp.index)
## [3, 2, 1, 0]
```

</div><br></div>

## RowNames - Index

- R `row.names()` are called [Index](https://pandas.pydata.org/docs/reference/api/pandas.Index.html) in Python and can be set by [set_index()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.set_index.html)
- R `data.frame()` has `row.names()` but `{tibble}` heavily discourage their usage
- Duplicated row indices are allowed in Python but not in R

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- data.frame(x = 1:2)
row.names(aa)
## [1] "1" "2"

row.names(aa) <- letters[1:2]                               #rownames

stopifnot(tibble::has_rownames(aa))
row.names(aa)
## [1] "a" "b"
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = pd.DataFrame(data = {'x': [1, 2]})
list(pp.index)

## [0, 1]
pp.set_index([pd.Index(['a', 'a'])], inplace = True)        #Duplicate index
pp.set_index([pd.Index(['a', 'b'])], inplace = True)
list(pp.index) 
## ['a', 'b']
```

</div><br></div>

## Copy

- For details [see here](#copy-p01)
- Python: For `deepcopy` of `DataFrame` either use [copy](https://docs.python.org/3/library/copy.html) or [copy()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.copy.html)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
george <- fred <- data.frame(x = 11:13)                     #R Copy-on-Modify

# Before modification both bind to the same address (unlike Python)
stopifnot(identical(obj_addr(fred), obj_addr(george)))

aa <- obj_addr(fred)                    #Address before modification

fred[2, 'x'] <- NA                      #Modify
fred$x
## [1] 11 NA 13

stopifnot(obj_addr(fred) != aa)     #Bind to a different address (unlike Python)

# No change in non-modified object (george) address or value (same as Python)
stopifnot(obj_addr(george) == aa)
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
fred = pd.DataFrame({'x': [1, 2, 3]})
george = fred.copy()                              #Deepcopy by default
percy  = copy.deepcopy(fred)                      #Deepcopy

# Deepcopy bind to different address even before modification (unlike R)
assert(id(fred) != id(george) != id(percy))

pp = id(fred)                           #Address before modification

fred.at[1, 'x'] = None                  #Modify
list(fred['x'])

## [1.0, nan, 3.0]
assert(id(fred) == pp)                  #No change in address (unlike R)

# No change in non-modified objects (george, percy) address or value (same as R)
assert(george.equals(percy) and not george.equals(fred))
```

</div><br></div>

## Modify 

- R `[]` (`base::Extract`) 
- Python:
  - [at](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.at.html) can only access a single value at a time (faster). It tries to maintain the datatype (fails sometimes). If column number is used by mistake, it creates a New Column (Avoid)
  - [loc](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.loc.html) can select multiple rows and/or columns (slower). It does not maintain the datatype and modifies the type silently.
  - [iat](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.iat.html), [iloc](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.iloc.html) are indices variants of the above

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- df_r
aa[1, 2] <- NA
aa[2, 'CHR'] <- NA
aa
##   INT NUM  CHR   LGL FCT
## 1   1  NA    a FALSE  No
## 2   2   2 <NA>  TRUE Yes
## 3   3   3    c FALSE  No
## 4   4   4    d  TRUE Yes
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = df_y.copy()
pp.at[0, 'NUM'] = None
pp.loc[1, 'CHR'] = None
pp.iat[3, 1] = 10.0
pp.iloc[2, 0] = 30
pp
##    INT   NUM   CHR    LGL  FCT
## 0    1   NaN     a  False   No
## 1    2   2.0  None   True  Yes
## 2   30   3.0     c  False   No
## 3    4  10.0     d   True  Yes
```

</div><br></div>



## Merge or Join

- An `inner join` matches pairs of observations whenever their `keys` are equal. Thus, unmatched rows are not included in the result. 
  - This means that generally inner joins are usually not appropriate for use in analysis because it is too easy to lose observations.
- An `outer join` keeps observations that appear in at least one of the tables. 
  - A `left join` keeps all observations in x.
  - A `right join` keeps all observations in y.
  - A `full join` keeps all observations in x and y.

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- tibble(key = c(1, 2, 3), valA = c('a1', 'a2', 'a3'))
bb <- tibble(key = c(1, 2, 4), valB = c('b1', 'b2', 'b4'))
# Inner Join
ab_join_inner <- dplyr::inner_join(x = aa, y = bb, by = 'key') 
ab_merg_inner <- merge(x = aa, y = bb, by = 'key')
stopifnot(identical(as.data.frame(ab_join_inner), ab_merg_inner))
# Left Outer Join
ab_join_left <- dplyr::left_join(x = aa, y = bb, by = 'key')
ab_merg_left <- merge(x = aa, y = bb, by = 'key', all.x = TRUE)
stopifnot(identical(as.data.frame(ab_join_left), ab_merg_left))
# Right Outer Join
ab_join_right <- dplyr::right_join(x = aa, y = bb, by = 'key')
ab_merg_right <- merge(x = aa, y = bb, by = 'key', all.y = TRUE)
stopifnot(identical(as.data.frame(ab_join_right), ab_merg_right))
# Full Outer Join
ab_join_full <- dplyr::full_join(x = aa, y = bb, by = 'key')
ab_merg_full <- merge(x = aa, y = bb, by = 'key', all = TRUE)
stopifnot(identical(as.data.frame(ab_join_full), ab_merg_full))
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
aa = pd.DataFrame({'key': (1, 2, 3), 'valA': ('a1', 'a2', 'a3')}) 
bb = pd.DataFrame({'key': (1, 2, 4), 'valB': ('b1', 'b2', 'b4')}) 

ab_inner = aa.merge(bb, on = 'key', how = 'inner')          #Inner Join
ab_left = aa.merge(bb, on = 'key', how = 'left')            #Left Outer Join
ab_right = aa.merge(bb, on = 'key', how = 'right')          #Right Outer Join
ab_full = aa.merge(bb, on = 'key', how = 'outer')           #Full Outer Join

ab_left
##    key valA valB
## 0    1   a1   b1
## 1    2   a2   b2
## 2    3   a3  NaN
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
ab_inner <- py$ab_inner |> `attr<-`('pandas.index', NULL) |> as_tibble()
ab_left <- py$ab_left |> `attr<-`('pandas.index', NULL) |> as_tibble()
ab_right <- py$ab_right |> `attr<-`('pandas.index', NULL) |> as_tibble()
ab_full <- py$ab_full |> `attr<-`('pandas.index', NULL) |> as_tibble()
identical(ab_join_inner, ab_inner)
## [1] TRUE
str(ab_join_left)
## tibble [3 × 3] (S3: tbl_df/tbl/data.frame)
##  $ key : num [1:3] 1 2 3
##  $ valA: chr [1:3] "a1" "a2" "a3"
##  $ valB: chr [1:3] "b1" "b2" NA
str(ab_left)
## tibble [3 × 3] (S3: tbl_df/tbl/data.frame)
##  $ key : num [1:3] 1 2 3
##  $ valA: chr [1:3] "a1" "a2" "a3"
##  $ valB:List of 3
##   ..$ : chr "b1"
##   ..$ : chr "b2"
##   ..$ : num NaN
identical(ab_join_left, ab_left)
## [1] FALSE
identical(ab_join_right, ab_right)
## [1] FALSE
identical(ab_join_full, ab_full)
## [1] FALSE
```

</div><br></div>

## Missing Values

- R: `NA` represents the missing values. 
  - `NULL` assignment to a `data.frame` element is problematic [(SO)](https://stackoverflow.com/a/7402059), [(SO)](https://stackoverflow.com/a/5023847). The column needs to be a `list` because `vector` cannot contain `NULL`. Further, `list()` has to be used instead of `c()` because `NULL` cannot be concatenated.
- Python Pandas [DataFrame()](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html) treats `None` in `numeric` columns as `np.nan`. It keeps `None` or `np.nan` in `object` columns as it is, however, internally these all are treated as missing values
- Note: `{reticulate}` currently converts `object` columns with `None` or `np.nan` to `list` containing `NULL` or `NaN`. It also converts `np.nan` in `numeric` column to `NaN`. All of these should be `NA`
  
<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# NULL cannot be concatenated
c(NULL, NULL)
## NULL
list(NULL, NULL)
## [[1]]
## NULL
## 
## [[2]]
## NULL

# Only list can contain NULL
aa <- data.frame(x = 1:3, y = I(list(NULL, 'b', 'c')))
aa$x <- list(4, NULL, 6)
str(aa)
## 'data.frame':	3 obs. of  2 variables:
##  $ x:List of 3
##   ..$ : num 4
##   ..$ : NULL
##   ..$ : num 6
##  $ y:List of 3
##   ..$ : NULL
##   ..$ : chr "b"
##   ..$ : chr "c"
##   ..- attr(*, "class")= chr "AsIs"

bb <- aa |> mutate(across(where(is.list), q_NULL_to_NA))
str(bb)
## 'data.frame':	3 obs. of  2 variables:
##  $ x: num  4 NA 6
##  $ y: chr  NA "b" "c"
```

</div><br></div>


```r
  q_NULL_to_NA <- function(x) {
    # Convert DataFrame list columns containing NULL or NaN to vector with NA
	# Ex: mutate(aa, across(where(is.list), q_NULL_to_NA))
	# Unlike is.na(), is.null() is not vectorised & is.nan() is not for list
	x[sapply(x, \(y) is.null(y) || is.nan(y))] <- NA
    x <- unlist(x)
    return(x)
  }
```

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = pd.DataFrame({'x': (None, 1, 2), 'y': ('a', None, np.nan)}) 
pp.info()
## <class 'pandas.core.frame.DataFrame'>
## RangeIndex: 3 entries, 0 to 2
## Data columns (total 2 columns):
##  #   Column  Non-Null Count  Dtype  
## ---  ------  --------------  -----  
##  0   x       2 non-null      float64
##  1   y       1 non-null      object 
## dtypes: float64(1), object(1)
## memory usage: 176.0+ bytes
pp
##      x     y
## 0  NaN     a
## 1  1.0  None
## 2  2.0   NaN
```

</div><br></div>

