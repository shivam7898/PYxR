# Window Functions {#window-p11}



## Basics

A window function is a variation on an aggregation function. Where an aggregation function, like `sum()` and `mean()`, takes n inputs and return a single value, a window function returns n values. The output of a window function depends on all its input values, so window functions do not include functions that work element-wise, like `round()`. Window functions include variations on aggregate functions, like `cumsum()` and `dplyr::cummean()`, functions for ranking and ordering, like `rank()`, and functions for taking offsets, like `dplyr::lead()` and `dplyr::lag()`. [(Refer)](https://cran.r-project.org/web/packages/dplyr/vignettes/window-functions.html)

## Ranks

- Python Pandas [rank()](https://pandas.pydata.org/docs/reference/api/pandas.Series.rank.html) Function & R `{dplyr}` package 
  - NOTE: [rank()](https://pandas.pydata.org/docs/reference/api/pandas.Series.rank.html) can return cumulative distribution equivalent to `dplyr::cume_dist()` but currently it cannot provide relative rank like `dplyr::percent_rank()`
- `dplyr::row_number()` attributes a unique value to each row
- `dplyr::min_rank()` attributes the same row number to the same value, leaving 'holes'
- `dplyr::dense_rank()` attributes the same row number to the same value, leaving no 'holes'
  - Ex: My salary might be the 2nd-highest (Dense Rank) the company pays. But, I might be the 4th-highest (Rank) paid employee if the same top salary is paid to 3 other people.
- `dplyr::percent_rank()` Rescaling min_rank() to [0, 1]
- `dplyr::cume_dist()` Proportion of all values less than or equal to the current rank.
- `ntile()` a rough rank, which breaks the input vector into n buckets

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa <- c(12, 15, 11, 13, NA, 12)
bb_row <- dplyr::row_number(aa)
bb_row_r <- rank(aa, ties.method = 'first', na.last = 'keep')
bb_row
## [1]  2  5  1  4 NA  3

dd_min <- dplyr::min_rank(aa)                     #Two 12, so skips once for 13
dd_min_r <- rank(aa, ties.method = 'min', na.last = 'keep')
dd_min
## [1]  2  5  1  4 NA  2

dplyr::dense_rank(aa)                             #Consecutive Rank (Dense Rank)
## [1]  2  4  1  3 NA  2

dplyr::percent_rank(aa)                           #Pandas do not have this
## [1] 0.25 1.00 0.00 0.75   NA 0.25

dplyr::cume_dist(aa)                              #Matches Pandas Percent Rank
## [1] 0.6 1.0 0.2 0.8  NA 0.6

dplyr::ntile(aa, n = 2)
## [1]  1  2  1  2 NA  1

stopifnot(all(identical(bb_row, bb_row_r), identical(dd_min, dd_min_r)))
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = pd.Series([12, 15, 11, 13, None, 12])
print(*pp)                  #Print Horizontal by using unpacking operator (*)
## 12.0 15.0 11.0 13.0 nan 12.0
print(*pp.rank(method = 'first'))                 #Row Number

## 2.0 5.0 1.0 4.0 nan 3.0
print(*pp.rank(method = 'min'))                   #Two 12, so skips once for 13

## 2.0 5.0 1.0 4.0 nan 2.0
print(*pp.rank(method = 'dense'))                 #Consecutive Rank (Dense Rank)

## 2.0 4.0 1.0 3.0 nan 2.0
qq = (pp.rank(method = 'min') - 1) / (pp.count() - 1)       #Percent Rank
print(*qq)

## 0.25 1.0 0.0 0.75 nan 0.25
print(*pp.rank(method = 'max', pct = True))       #Cumulative Distance
## 0.6 1.0 0.2 0.8 nan 0.6
```

</div><br></div>

## Data: Lahman

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# DF | Tibble | Subset | Sort | Semi Join |
batting <- Lahman::Batting |> 
    as_tibble() |> 
    select(playerID, yearID, teamID, G, AB, R, H) |> 
    arrange(playerID, yearID, teamID) |> 
    semi_join(Lahman::AwardsPlayers, by = "playerID")

# Grouped Tibble
players <- batting |> group_by(playerID)
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Grouped Players
players |> head()
## # A tibble: 6 × 7
## # Groups:   playerID [1]
##   playerID  yearID teamID     G    AB     R     H
##   <chr>      <int> <fct>  <int> <int> <int> <int>
## 1 aaronha01   1954 ML1      122   468    58   131
## 2 aaronha01   1955 ML1      153   602   105   189
## 3 aaronha01   1956 ML1      153   609   106   200
## 4 aaronha01   1957 ML1      151   615   118   198
## 5 aaronha01   1958 ML1      153   601   109   196
## 6 aaronha01   1959 ML1      154   629   116   223
```

</div><br></div>

## Test

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# For each player, find the two years with most hits
dplyr::filter(players, min_rank(desc(H)) <= 2 & H > 0)
## # A tibble: 2,917 × 7
## # Groups:   playerID [1,385]
##    playerID  yearID teamID     G    AB     R     H
##    <chr>      <int> <fct>  <int> <int> <int> <int>
##  1 aaronha01   1959 ML1      154   629   116   223
##  2 aaronha01   1963 ML1      161   631   121   201
##  3 abbotji01   1999 MIL       20    21     0     2
##  4 abernte02   1955 WS1       40    26     1     4
##  5 abernte02   1957 WS1       26    24     3     4
##  6 abreubo01   1999 PHI      152   546   118   183
##  7 abreubo01   2000 PHI      154   576   103   182
##  8 abreujo02   2016 CHA      159   624    67   183
##  9 abreujo02   2017 CHA      156   621    95   189
## 10 acunaro01   2018 ATL      111   433    78   127
## # … with 2,907 more rows
## # ℹ Use `print(n = ...)` to see more rows


# Within each player, rank each year by the number of games played
dplyr::mutate(players, G_rank = min_rank(G))
## # A tibble: 20,706 × 8
## # Groups:   playerID [1,436]
##    playerID  yearID teamID     G    AB     R     H G_rank
##    <chr>      <int> <fct>  <int> <int> <int> <int>  <int>
##  1 aaronha01   1954 ML1      122   468    58   131      4
##  2 aaronha01   1955 ML1      153   602   105   189     13
##  3 aaronha01   1956 ML1      153   609   106   200     13
##  4 aaronha01   1957 ML1      151   615   118   198     12
##  5 aaronha01   1958 ML1      153   601   109   196     13
##  6 aaronha01   1959 ML1      154   629   116   223     17
##  7 aaronha01   1960 ML1      153   590   102   172     13
##  8 aaronha01   1961 ML1      155   603   115   197     18
##  9 aaronha01   1962 ML1      156   592   127   191     20
## 10 aaronha01   1963 ML1      161   631   121   201     23
## # … with 20,696 more rows
## # ℹ Use `print(n = ...)` to see more rows
```

</div><br></div>




