# Window Functions {#window-p11}



## Basics

A window function is a variation on an aggregation function. Where an aggregation function, like `sum()` and `mean()`, takes n inputs and return a single value, a window function returns n values. The output of a window function depends on all its input values, so window functions do not include functions that work element-wise, like `round()`. Window functions include variations on aggregate functions, like `cumsum()` and `dplyr::cummean()`, functions for ranking and ordering, like `rank()`, and functions for taking offsets, like `dplyr::lead()` and `dplyr::lag()`. [(Refer)](https://cran.r-project.org/web/packages/dplyr/vignettes/window-functions.html)

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
#
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




