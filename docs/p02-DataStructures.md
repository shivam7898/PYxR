# Data Structures {#structures-p02}



## R Atomic Vectors or Data Types

- R has 6 basic data types (`logical`, `integer`, `double`, `character`, `complex`, and `raw`). These data types can be combined to form Data Structures (`vector`, `list`, `matrix`, `dataframe`, `factor`). 
  - Vectors are the simplest type of data structure in R. A `vector` is a sequence of data elements of the same basic type. 
  - Members of a `vector` are called 'components'.
  - Atomic vectors are homogeneous i.e. each component has the same datatype. 
  - A vector type can be checked with the `typeof()` function.
  - `list` is a `vector` but not an 'atomic vector'.

- Create a vector or a list by `c()`
  - In R, a literal character or number is just a vector of length 1. 
  - So, `c()` 'combines' them together in a series of 1-length vectors. It neither 'creates' nor 'concatenates' the vectors. It combines lists into a list and vectors into a vector.
  - All attributes (e.g. `dim`) except `names` are removed.
  - All arguments are coerced to a common type 
  - The output type is determined from the highest type of the components in the hierarchy `NULL` < `raw` < `logical` < `integer` < `double` < `complex` < `character` < `list` < `expression`.
  
<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Integer: To declare as integer "L" (not "l") is added as Suffix
str(c(1L, 2L, NA, 4L, 5L))
##  int [1:5] 1 2 NA 4 5

# Double (& Default)
str(c(1, 2, NA, 4, 5))
##  num [1:5] 1 2 NA 4 5

# Character
str(c('a', 'b', NA, 'd', 'e'))
##  chr [1:5] "a" "b" NA "d" "e"

# Logical
str(c(TRUE, FALSE, NA, FALSE, TRUE))
##  logi [1:5] TRUE FALSE NA FALSE TRUE
```

</div><br></div>

### Examination of R Data Types

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# To know about an Object Named Vector (pi, letters are predefined)
aa <- setNames(c(1, 2, NA, pi, 4), nm = letters[1:5])

typeof(aa)              # Type
## [1] "double"
class(aa)               # Class
## [1] "numeric"
str(aa)                 # Structure
##  Named num [1:5] 1 2 NA 3.14 4
##  - attr(*, "names")= chr [1:5] "a" "b" "c" "d" ...
length(aa)              # Length
## [1] 5
dim(aa)                 # Dimensions
## NULL
is(aa)                  # Inheritance
## [1] "numeric"      "vector"       "index"        "replValue"    "numLike"     
## [6] "number"       "atomicVector" "replValueSp"
names(attributes(aa))   # Attributes
## [1] "names"
names(aa)               # Names
## [1] "a" "b" "c" "d" "e"
```

</div><br></div>

### R Matrices and Arrays

- `Matrices` and `arrays` are simply vectors with the attribute `dim` attached to the vector. 
  - The data elements must be of the same basic type.
  - A `matrix` is a two-dimensional rectangular data set. 
  - `Arrays` are multi-dimensional Data structures. Data is stored in the form of matrices, row, and as well as in columns. 

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create Matrix
aa <- matrix(1:6, nrow=3, ncol=2, byrow=TRUE, dimnames=list(NULL, c("x", "y")))
bb <- matrix(1:6, nrow=3, ncol=2, byrow=FALSE, dimnames=list(NULL, c("x", "y")))

print(aa)
##      x y
## [1,] 1 2
## [2,] 3 4
## [3,] 5 6
print(bb)
##      x y
## [1,] 1 4
## [2,] 2 5
## [3,] 3 6

# About
str(aa)
##  int [1:3, 1:2] 1 3 5 2 4 6
##  - attr(*, "dimnames")=List of 2
##   ..$ : NULL
##   ..$ : chr [1:2] "x" "y"
dim(aa)
## [1] 3 2
length(aa)
## [1] 6

# Matrices have 'dimnames' attribute instead of usual 'names'
names(attributes(aa))
## [1] "dim"      "dimnames"
names(aa)
## NULL
dimnames(aa) 
## [[1]]
## NULL
## 
## [[2]]
## [1] "x" "y"
```

</div><br></div>

### R Lists

- Lists have 'elements', each of which can contain any type of R object, i.e. the elements of a list do not have to be of the same type.
  - `list` is a `vector` but not an 'atomic vector'.

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create List (letters is predefined vector of 26 elements)
aa <- list(x = 4:6, y = letters[4:8])
print(aa)
## $x
## [1] 4 5 6
## 
## $y
## [1] "d" "e" "f" "g" "h"

# About
str(aa)
## List of 2
##  $ x: int [1:3] 4 5 6
##  $ y: chr [1:5] "d" "e" "f" "g" ...
length(aa)              # Number of elements in the List
## [1] 2
lengths(aa)             # Number of components of each element of the List
## x y 
## 3 5
stopifnot(identical(lengths(aa), sapply(aa, length)))

names(attributes(aa))   # Attributes
## [1] "names"
names(aa)               # Names of elements
## [1] "x" "y"
```

</div><br></div>

### R DataFrames

- Data frame is a list of `vectors`, `factors`, and/or `matrices` all having the same length (number of rows in the case of matrices).
  - A `data frame` can contain a `list` that is the same length as the other components. 

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create DataFrame (letters is predefined vector of 26 elements)
aa <- data.frame(x = 4:6, y = letters[4:6])
print(aa)
##   x y
## 1 4 d
## 2 5 e
## 3 6 f

# About
str(aa)
## 'data.frame':	3 obs. of  2 variables:
##  $ x: int  4 5 6
##  $ y: chr  "d" "e" "f"
dim(aa)                 #Dimensions Row x Column
## [1] 3 2
stopifnot(all(identical(nrow(aa), dim(aa)[1]),
              identical(ncol(aa), dim(aa)[2])))

names(attributes(aa))   # Attributes
## [1] "names"     "class"     "row.names"
names(aa)               # Names of column headers
## [1] "x" "y"

is.list(aa)
## [1] TRUE
is.vector(aa)
## [1] FALSE
is.atomic(aa)
## [1] FALSE
```

</div><br></div>

### R Factors

- `Factors` are used to describe items that can have a finite number of values (gender, social class, etc.). A factor has a `levels` attribute and class `factor`. 
  - A factor may be purely nominal or may have ordered categories. 

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create Factors Unordered
aa <- factor(c("female", "male", "male", "female", "male"), ordered = FALSE)
# Create Factors Ordered
bb <- factor(c("female", "male", "male", "female", "male"), ordered = TRUE)

print(aa)
## [1] female male   male   female male  
## Levels: female male
print(bb)
## [1] female male   male   female male  
## Levels: female < male

# About
str(aa)
##  Factor w/ 2 levels "female","male": 1 2 2 1 2
str(bb)
##  Ord.factor w/ 2 levels "female"<"male": 1 2 2 1 2

nlevels(aa)             # Count of Levels
## [1] 2
levels(aa)              # Vector of Levels
## [1] "female" "male"
names(attributes(aa))   # Attributes
## [1] "levels" "class"
```

</div><br></div>

### Membership Functions

- `anyNA()` is `TRUE` if there is an `NA` present, `FALSE` otherwise
- `is.atomic()` is `TRUE` for all atomic vectors, factors, matrices but is `FALSE` for lists and dataframes
- `is.vector()` is `TRUE` for all atomic vectors, lists but is `FALSE` for factors, matrices, DATE & POSIXct
  - It returns `FALSE` if the vector has attributes (except `names`) ex: DATE, POSIXct, DataFrames (even though a Dataframe is a list and a list is a vector)
- `is.numeric()` is `TRUE` for both `integer` and `double`
- `is.integer()`, `is.double()`, `is.character()`, `is.logical()` are `TRUE` for their respective datatypes only
- `is.factor()`, `is.ordered()` are membership functions for factors with or without ordering

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create Objects
aa_num <- setNames(c(1, 2, NA, pi, 4), nm = letters[1:5])
bb_mat <- matrix(1:6, nrow=3, ncol=2, byrow=TRUE)
dd_dft <- data.frame(x = 4:6, y = letters[4:6])
ee_lst <- list(x = 4:6, y = letters[4:8])
ff_fct <- factor(c("female", "male", "male", "female", "male"), ordered = FALSE)

# List of Objects
gg <- list(Vector = aa_num, Matrix = bb_mat, DataFrame = dd_dft, 
            List = ee_lst, Factor = ff_fct)

# Apply a membership function on all of the objects inside the list
names(which(sapply(gg, is.atomic)))
## [1] "Vector" "Matrix" "Factor"
names(which(sapply(gg, is.vector)))
## [1] "Vector" "List"
names(which(sapply(gg, is.matrix)))
## [1] "Matrix"
names(which(sapply(gg, is.list)))
## [1] "DataFrame" "List"
names(which(sapply(gg, is.data.frame)))
## [1] "DataFrame"
names(which(sapply(gg, is.factor)))
## [1] "Factor"
```

</div><br></div>


## Python

### Collections: List, Tuple, Set, Dictionary


- Python `list` is ordered and changeable. 
  - It allows duplicate members. 
  - It is defined using square brackets `[]`
  - Python lists are modified in place. 
- `Tuple` is ordered and unchangeable. 
  - It allows duplicate members. 
  - It is defined using parentheses `()`
- `Set` is unordered, unchangeable, and unindexed. 
  - It does not allow duplicate members. 
  - Set items are unchangeable, but we can remove and/or add items.
- `Dictionary` is ordered and changeable. 
  - It does not allow duplicate members. 
  - It is defined using braces `{}`
  - Duplicate values will overwrite existing values

