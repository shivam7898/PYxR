# Data Structures {#structures-p02}



## R Data Types

- R has 6 basic data types (`logical`, `integer`, `double`, `character`, `complex`, and `raw`). These data types can be combined to form Data Structures (`vector`, `list`, `matrix`, `dataframe`, `factor`). 
  - Vectors are the simplest type of data structure in R. A `vector` is a sequence of data elements of the same basic type. 
  - Members of a `vector` are called 'elements'.
  - Atomic vectors are homogeneous i.e. each component has the same datatype. 
  - A vector type can be checked with the `typeof()` function.
  - `list` is a `vector` but not an 'atomic vector'.

- Create a vector or a list by `c()`
  - In R, a literal character or number is just a vector of length 1. 
  - So, `c()` 'combines' them together in a series of 1-length vectors. It neither 'creates' nor 'concatenates' the vectors. It combines lists into a list and vectors into a vector.
  - All attributes (e.g. `dim`) except `names` are removed.
  - All arguments are coerced to a common type 
  - The output type is determined from the highest type of the components in the hierarchy `NULL` < `raw` < `logical` < `integer` < `double` < `complex` < `character` < `list` < `expression`.
  
<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Integer: To declare as integer 'L' (not 'l') is added as Suffix
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

- Examination of R Data Types

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

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
is(aa)[1:6]             # Inheritance
## [1] "numeric"   "vector"    "index"     "replValue" "numLike"   "number"
names(attributes(aa))   # Attributes
## [1] "names"
names(aa)               # Names
## [1] "a" "b" "c" "d" "e"
```

</div><br></div>

## R Matrices

- `Matrices` and `arrays` are vectors with the attribute `dim` attached to them 
  - The data elements must be of the same basic type.
  - A `matrix` is a two-dimensional rectangular data set. 
  - 'Arrays' are multi-dimensional Data structures. Data is stored in the form of matrices, row, and as well as in columns. 

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create Matrix
aa <- matrix(1:6, nrow=3, ncol=2, byrow=TRUE, dimnames=list(NULL, c('x', 'y')))
bb <- matrix(1:6, nrow=3, ncol=2, byrow=FALSE, dimnames=list(NULL, c('x', 'y')))

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

## R DataFrames

- Data frame is a list of `vectors`, `factors`, and/or `matrices` all having the same length (number of rows in the case of matrices).
  - A `data frame` can contain a `list` that is the same length as the other components. 

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

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

## R Factors

- `Factors` are used to describe items that can have a finite number of values (gender, social class, etc.). A factor has a `levels` attribute and class `factor`. 
  - A factor may be purely nominal or may have ordered categories. 

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create Factors Unordered
aa <- factor(c('female', 'male', 'male', 'female', 'male'), ordered = FALSE)
# Create Factors Ordered
bb <- factor(c('female', 'male', 'male', 'female', 'male'), ordered = TRUE)

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

## R Membership

- `anyNA()` is `TRUE` if there is an `NA` present, `FALSE` otherwise
- `is.atomic()` is `TRUE` for all atomic vectors, factors, matrices but is `FALSE` for lists and dataframes
- `is.vector()` is `TRUE` for all atomic vectors, lists but is `FALSE` for factors, matrices, DATE & POSIXct
  - It returns `FALSE` if the vector has attributes (except `names`) ex: DATE, POSIXct, DataFrames (even though a Dataframe is a list and a list is a vector)
- `is.numeric()` is `TRUE` for both `integer` and `double`
- `is.integer()`, `is.double()`, `is.character()`, `is.logical()` are `TRUE` for their respective datatypes only
- `is.factor()`, `is.ordered()` are membership functions for factors with and without ordering respectively

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Create Objects
aa_num <- setNames(c(1, 2, NA, pi, 4), nm = letters[1:5])
bb_mat <- matrix(1:6, nrow=3, ncol=2, byrow=TRUE)
dd_dft <- data.frame(x = 4:6, y = letters[4:6])
ee_lst <- list(x = 4:6, y = letters[4:8])
ff_fct <- factor(c('female', 'male', 'male', 'female', 'male'), ordered = FALSE)

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

## Python Types

- [(doc) Built-in Types](https://docs.python.org/3/library/stdtypes.html#)

- General
  - The principal built-in types are numerics, sequences, mappings, classes, instances and exceptions.
  - Some collection classes are `mutable`. The methods that add, subtract, or rearrange their members in place, and do not return a specific item, never return the collection instance itself but `None`.
  - Practically all objects can be compared for equality, tested for truth value, and converted to a string.

- Truth Value Testing
  - constants defined to be false: `None` and `False`.
  - zero of any numeric type: `0, 0.0, 0j, Decimal(0), Fraction(0, 1)`
  - empty sequences and collections: `'', (), [], {}, set(), range(0)`

- Boolean Operations in ascending order: `and`, `or`, `not`
- There are eight comparison operations in Python.

- Numeric Types: `int`, `float`, `complex`
  - Booleans are a subtype of integers
  - Python Integers have unlimited precision. Whereas, R integers are limited to $(2^{31} - 1 = 2147483647)$

- Iterator Types
  - Sequences always support the iteration methods.

- Sequence Types: `list`, `tuple`, `range`
  - Negative value of index is relative to the end of the sequence in Python. Whereas, it acts to exclude those indices
  - Concatenating immutable sequences always results in a new object. 
  - The `range` type represents an immutable sequence of numbers and is commonly used for looping a specific number of times in `for` loops.

- Text Sequence Type: `str`
  - Strings are immutable sequences of Unicode code points.

- Set Types: `set` (mutable), `frozenset` (immutable)

- Mapping Types: `dict`

## Similarities

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# R results are same as Python
stopifnot(0  == 1 %/% 2 )
stopifnot(-1 == (-1) %/% 2 )
stopifnot(-1 == 1 %/% (-2) )
stopifnot(0  == (-1) %/% (-2) )

# 1^y and y^0 are 1, ALWAYS in both R and Python
stopifnot(all(sapply(list(0**0, NaN**0, NA**0, Inf**0, 1**NA, 1**NaN), 
                     identical, 1)))

stopifnot(is.nan(NaN * 0))
stopifnot(is.na(NA * 0) & !is.nan(NA * 0))        #NA

stopifnot(is.nan(Inf * 0))
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Python results are same as R
assert(0  == 1//2 )
assert(-1 == (-1) // 2 )
assert(-1 == 1 // (-2) )
assert(0  == (-1) // (-2) )

# 1^y and y^0 are 1, ALWAYS in both R and Python
assert(1 == 0**0 == np.nan**0 == 1**np.nan)

assert(np.isnan(np.nan * 0))
assert(np.isnan(math.inf * 0))
```

</div><br></div>

## Differences

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# R allows division by zero whereas Python throws ZeroDivisionError
stopifnot(is.na(0L %/% 0L) & !is.nan(0L %/% 0L))  #NA
stopifnot(is.nan(0 %/% 0 ))                       #NaN
stopifnot(is.infinite(1 %/% 0))                   #Inf
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# R index starts from 1, whereas Python index starts from 0
# R range includes the maximum value, whereas Python excludes it
seq.int(length.out = 5)
## [1] 1 2 3 4 5
seq.int(from = 0, length.out = 5)
## [1] 0 1 2 3 4
seq.int(to = 10, length.out = 5)
## [1]  6  7  8  9 10
seq.int(by = -2, length.out = 5)
## [1]  1 -1 -3 -5 -7

# Colon ':' acts as sequence in R, Python uses colon for dictionary key:value
# Colon should be avoided in R if the range limits may change
1:5
## [1] 1 2 3 4 5
1:0
## [1] 1 0
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Python index starts from 0, whereas R index starts from 1
# Python range excludes the maximum value, whereas R includes it
list(range(5))
## [0, 1, 2, 3, 4]
list(range(1, 6))
## [1, 2, 3, 4, 5]
list(range(10, 1, -2))
## [10, 8, 6, 4, 2]
```

</div><br></div>

## Python Collections

- Python Collections: List, Tuple, Set, Dictionary
  - `tuple`: Literal `()`, Ordered, Immutable, Allows Duplicates, [Refer](https://docs.python.org/3/library/stdtypes.html#tuples)
  - `list` : Literal `[]`, Ordered, Mutable, Allows Duplicates, [Refer](https://docs.python.org/3/library/stdtypes.html#lists)
  - `dict` : Literal `{}`, Ordered, Mutable, No Duplicates, [Refer](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)
  - `set`  : Literal `{}`, Unordered, Mutable, No Duplicates, [Refer](https://docs.python.org/3/library/stdtypes.html#set-types-set-frozenset)
    - Effectively, 'sets' are 'dictionaries' without keys
    - Indexing and slicing does not work on `set` because it is unordered
    - Immutable objects include `numbers`, `strings` and `tuples`. [Refer](https://docs.python.org/3/glossary.html). 
    - `set` is converted to `R environment`. However, it is tricky to handle, so it is being put on hold for now. Note that python set operations like 'set difference' can be applied using scope resolution i.e. `py$set_x$difference(set_y)`


<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = 11                                           # int
print(f'{type(pp) = }   |     ...     | {pp = }')
## type(pp) = <class 'int'>   |     ...     | pp = 11
pp = 11,                                          # Implicit Tuple
print(f'{type(pp) = } | {len(pp) = } | {pp = }')
## type(pp) = <class 'tuple'> | len(pp) = 1 | pp = (11,)
pp = (11, )                                       # Length 1 Tuple needs comma
print(f'{type(pp) = } | {len(pp) = } | {pp = }')
## type(pp) = <class 'tuple'> | len(pp) = 1 | pp = (11,)
pp = (11, 22, 33)                                 # Tuple
print(f'{type(pp) = } | {len(pp) = } | {pp = }')
## type(pp) = <class 'tuple'> | len(pp) = 3 | pp = (11, 22, 33)
pp = [11, 22, 33]                                 # List
print(f'{type(pp) = }  | {len(pp) = } | {pp = }')
## type(pp) = <class 'list'>  | len(pp) = 3 | pp = [11, 22, 33]
pp = {11, 22, 33}                                 # Set (unordered)
print(f'{type(pp) = }   | {len(pp) = } | {pp = }')
## type(pp) = <class 'set'>   | len(pp) = 3 | pp = {33, 11, 22}
pp = {'a': 11, 'b': 22, 'c': 33}                  # Dictionary
print(f'{type(pp) = }  | {len(pp) = } | {pp = }')
## type(pp) = <class 'dict'>  | len(pp) = 3 | pp = {'a': 11, 'b': 22, 'c': 33}
```

</div><br></div>

## NumPy Array

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = np.arange(12).reshape((3,4))
print(type(pp))
## <class 'numpy.ndarray'>
print(pp)
## [[ 0  1  2  3]
##  [ 4  5  6  7]
##  [ 8  9 10 11]]
assert(np.array_equal(pp[0, :], pp[0, ]))         #Verify same shape & values
print(pp[0, ])                                    #Subset First Row
## [0 1 2 3]
```

</div><br></div>





