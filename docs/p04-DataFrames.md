# Data Frame {#df-p04}



R provides `data.frame` for tabular data structure. `tibble` & `data.table` are packages which extends its capabilities. Python module `pandas` provide `DataFrame` with similar capabilities. 

## Basics

- R
  - R `data.frame` is a `list` of variables of the same number of rows. It is a `matrix` like structure whose columns may be of differing types.

- Create R `data.frame`, `tibble`, & Python Pandas `DataFrame`

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
nn <- 4L                                          #Number of Rows

# R Data Frame
df_r <- data.frame(
  INT = 1:nn, NUM = seq(1, nn, 1), CHR = letters[1:nn], LGL = (1:nn %% 2) == 0, 
  FCT = factor(rep(c("No", "Yes"), length.out = nn)))
# Tibble
tbl <- tibble(
  INT = 1:nn, NUM = seq(1, nn, 1), CHR = letters[1:nn], LGL = (1:nn %% 2) == 0, 
  FCT = factor(rep(c("No", "Yes"), length.out = nn)))

stopifnot(all(identical(df_r, as.data.frame(tbl)), 
              identical(tbl, as_tibble(df_r))))
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

df_y = pd.DataFrame(data = qq)                    #DataFrame
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- py$df_y |> `attr<-`("pandas.index", NULL)
aa$INT <- as.integer(aa$INT)
#str(df_r)
#str(aa)
stopifnot(identical(df_r, aa))
```

</div><br></div>

- Print, Head & Tail Subset

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE) print(df_r)                   #Data Frame prints ALL Rows (Avoid)
if(FALSE) print(tbl, n = 2)             #Tibble can take number of rows to print 

head(df_r, 2)                                     #Subset of Data Frame by Head
##   INT NUM CHR   LGL FCT
## 1   1   1   a FALSE  No
## 2   2   2   b  TRUE Yes

tail(tbl, 2)                                      #Subset of Tibble by Tail
## # A tibble: 2 × 5
##     INT   NUM CHR   LGL   FCT  
##   <int> <dbl> <chr> <lgl> <fct>
## 1     3     3 c     FALSE No   
## 2     4     4 d     TRUE  Yes
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
df_y.head(2)
##    INT  NUM CHR    LGL  FCT
## 0    1  1.0   a  False   No
## 1    2  2.0   b   True  Yes
df_y.tail(2)
##    INT  NUM CHR    LGL  FCT
## 2    3  3.0   c  False   No
## 3    4  4.0   d   True  Yes
```

</div><br></div>


- About: Class, Type, Dimensions, Structure, Summary

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
dim(df_r)                                         #Dimensions [Row, Column]
## [1] 4 5

names(df_r)                                       #Names
## [1] "INT" "NUM" "CHR" "LGL" "FCT"

str(df_r)                                         #Structure
## 'data.frame':	4 obs. of  5 variables:
##  $ INT: int  1 2 3 4
##  $ NUM: num  1 2 3 4
##  $ CHR: chr  "a" "b" "c" "d"
##  $ LGL: logi  FALSE TRUE FALSE TRUE
##  $ FCT: Factor w/ 2 levels "No","Yes": 1 2 1 2

summary(df_r)                                     #Summary
##       INT            NUM           CHR               LGL           FCT   
##  Min.   :1.00   Min.   :1.00   Length:4           Mode :logical   No :2  
##  1st Qu.:1.75   1st Qu.:1.75   Class :character   FALSE:2         Yes:2  
##  Median :2.50   Median :2.50   Mode  :character   TRUE :2                
##  Mean   :2.50   Mean   :2.50                                             
##  3rd Qu.:3.25   3rd Qu.:3.25                                             
##  Max.   :4.00   Max.   :4.00
```

</div><br></div>



