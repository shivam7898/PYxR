# Introduction {#introduction-p01}



## Basics

- Both R and Python are case-sensitive
- Both R and Python use the Hash sign `#` to comment out anything after it, till the newline
- Both R and Python keep the Backslash `\` as reserved to escape the character that follows it

- Refer [This](#object-p01)

> In R & Python, Everything that exists is an `object`.  

- Indexing starts from 1 in R and from 0 in Python. 
- Periods `.` (dots)
  - In Python, dot `.` is a member access operator use to access methods of the object(class instance). Thus, it can be used to pipe or chain together multiple operations. 
  - In Python, dot cannot be part of object name. Whereas, R does not treat dot as special.
  - R uses `|>` as pipe operator along with underscore `_` as placeholder
  - To minimize the issues, in this book, underscore will be used (and dot will be avoided) in names of objects or variables names
- R functions implicitly return the last object evaluated. Whereas, Python functions return explicitly only. 

- [Primer on Python for R Users](https://cran.r-project.org/web/packages/reticulate/vignettes/python_primer.html)
- Information on R for Python Users
  - In R, Methods (or Functions) are not part of the class definitions. Methods in R look at the `class` of the objects and may behave differently based on them. 
  - Ex: `summary()` of `numeric vector` and `factor vector` will be different i.e. these will be summarised differently. `summary()` checks the `class` attribute of the object and it calls a method for summarizing objects of that class. 
  - Slicing / Subsetting:
    - In R, both start and stop values are inclusive during slicing, unlike Python where stop value is exclusive.
    - In R, both start and stop values are to be specified during slicing, unlike Python where if you do not specify the start/stop value it refers to the first/last value respectively.
    - Dash `-` (or Minus) acts as reverse index in Python, whereas in R it removes the specified elements

## Braces & Indentation

- R uses braces `{}` to group expressions in code blocks and ignores indentation
- Indentation and white spaces are extremely significant in Python (unlike R)
  - 4 Spaces (not Tab) are being used, in this book, for Python chunks
  - A backslash `\` allows you to break up one long piece of code into several parts
  - Any character (including whitespace) after the backslash will cause an error
  - Parentheses `()` can be used to enclose all of the code. Parentheses work like the backslash, but allow extra characters at the end


## Mathematical Operators

- R `base::Arithmetic`) and Python [operator](https://docs.python.org/3/library/operator.html) both have following operators:  
  - Addition `+`, Subtraction `-`, Multiplication `*`, Division `/`
  - Exponent is given by caret `^` or `**` in R and by `**` in Python
    - Python uses caret for bitwise `XOR`
  - Modulus (Remainder) is given by `%%` in R and by `%` in Python
    - Python uses `%%` to escape the percent sign in strings
    - R does not use standalone `%` as an operator (except for special cases like `sprintf()`)
    - However, R uses `%...%` syntax to define some special operators (infix operators) like `%*%`, `%in%`, etc.
  - Integer Division (Quotient) is given by `%/%` in R and by `//` in Python
    - Python does not use `%/%` and R does not use `//`

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Exponent
5 ** 3
## [1] 125
5 ^ 3
## [1] 125

5 %% 3    # Modulus (Remainder)
## [1] 2
5 %/% 3   # Integer Division (Quotient)
## [1] 1
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Exponent
5 ** 3
## 125
5 % 3     # Modulus (Remainder)
## 2
5 // 3    # Integer Division (Quotient)
## 1
```

</div><br></div>

## Help

- R `help()` and Python [help()](https://docs.python.org/3/library/functions.html#help) can be used to get details about the topic
  - R also has a shorthand to get help by prefixing `?` before the topic

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE) {
  help(print)
  ?print
  ?`+`
}
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
if(False):
    help(print)

```

</div><br></div>

## Print

- Printing is largely handled by `print()` in R and [print()](https://docs.python.org/3/library/functions.html#print) in Python 
  - Explicit and Implicit both types of printing is available


## NA NaN 0/0 - nan

- 0/0 is `NaN` (Not a Number) in R but is undefined in Python
  - The IEEE754 standard defines three special floating-point numbers, `Inf`, `-Inf` and `NaN`
  - `NaN` is 'not well-defined real number'
  - In numerical computing, if the result can not be written in regular real number, or `Inf` or `-Inf`, it is expressed as `NaN`. 
- `NA` and `NaN`
  - Python does not distinguish between 'missing values' and 'not a number'. whereas, R clearly distinguish between `NA` and `NaN`
  - `NaN` is a float value, so we cannot have explicit missing values in non-float columns. In R, `NA` can be of any type.

- Comparison operation with `NaN` (even with itself) 
  - Python: `==` returns `False`, `!=` returns `True` (IEEE754 Standard)
  - R: All such operations (`==`, `!=`, `>=` `<=`, `>`, `<`) results in `NA` 
  - R: `NA` or `NaN` compared to anything is `NA`.

- Coercion of `NaN` in R (Or Casting or Conversion)
  - `NaN` coercion to `integer` gives `NA_integer_` 
  - `NaN` coercion to `logical` gives `NA`
  - `NaN` coercion to `numeric` gives `NaN` 
  - `NaN` coercion to `character` gives `"NaN"`
  
- Reticulate: 
  - In python, missing values are also `NaN`
  - Both `np.nan` and `math.nan` of Python are converted to `NaN` of R
  - `NaN` of R is converted to `NaN` of Python 
  
- Pandas
  - Both `np.nan` and `math.nan` are treated as 'missing values' with class as `numpy.float64`
  - `None` is also treated as a missing value. For numeric columns, `None` is converted to `nan`. For columns of `object` type, it is kept as `None` but is treated as missing value.
  - There exist a `pd.NA` scalar in Pandas, similar to R `NA`. However, it is experimental and currently treated as `np.nan` internally. So, not being used for now, in this book.

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# 0/0 is defined as NaN in R (unlike Python)
is.nan(NaN)
## [1] TRUE
is.nan(0/0)
## [1] TRUE

# NaN is treated as NA, however, NA is not treated as NaN
is.na(NaN)
## [1] TRUE
is.nan(NA)
## [1] FALSE

# NaN is numeric
stopifnot(is.numeric(NaN))

# Comparison with NaN: All operations are NA, use is.nan() (unlike IEEE, Python)
stopifnot(all(sapply(list(NaN == NaN, NaN <= NaN, NaN >= NaN, 
                          NaN != NaN, NaN <  NaN, NaN >  NaN), identical, NA)))

# Coercion of NaN
stopifnot(all(identical(as.integer(NaN), NA_integer_),
              identical(as.logical(NaN), NA),
              identical(as.character(NaN), "NaN"),
              identical(as.numeric(NaN), NaN)))
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# 0/0 is undefined in Python (unlike R)
try:
    print(0/0)
except ZeroDivisionError as e:
    print(e) #e.args type(e)

# There are Two NaN in modules NumPy and Math
# Use module specific methods but not the 'is' keyword
## division by zero
pp = float("NaN") # Not case sensitive i.e. NaN, NAN, nan etc. all are valid
print(pp)
## nan
type(pp)
## <class 'float'>
assert(math.isnan(math.nan) and math.isnan(np.nan) and math.isnan(pp))
assert(np.isnan(np.nan) and np.isnan(math.nan) and np.isnan(pp))

# 'is' returns True if and only if the two references are to the same object
np.nan is math.nan            # False

# Comparison with NaN: == is False, != is True (as per IEEE but unlike R)
## False
np.nan == np.nan
## False
math.nan == math.nan
 
## False
np.nan != np.nan
## True
math.nan != math.nan
## True
```

</div><br></div>

## Boolean

- R (`TRUE`, `FALSE`) vs. Python (`True`, `False`) - Case is different
- Python:
  - All values are considered "truthy" except for the following, which are "falsy"
    - `None`, `False`, `0`, `0.0`, `0j`, `Decimal(0)`, `Fraction(0, 1)`
    - Empty: list `[]`, dictionary `{}`, tuple `()`, string `''`, range `range(0)` etc.
    - objects for which:
      - `obj.__bool__()` returns `False`
      - `obj.__len__()` returns `0`
    - A "truthy" value will satisfy the check performed by `if` or `while` statements. 
    - We use "truthy" and "falsy" to differentiate from the bool values `True` and `False`.
    - Python determines the truthiness by applying `bool()` to the type, which returns `True` or `False` which is used in an expression like `if` or `while`. 
      - Instances of a user-defined class are considered truthy by default.


## Logical Operators

- Both R and Python short-circuit the evaluation

- R uses `&`, `&&` to indicate `logical AND` and `|`, `||` to indicate `logical OR`. 
  - R does not use 'and' or 'or'
  - The shorter operators (`&`, `|`) are vectorized. Given two vectors, they will logically compare pairs of elements from each vector. 
    - Output will have length equal to the length of longer vector using `vector recycling`
    - `Warning: longer object length is not a multiple of shorter object length` will trigger if lengths of both vector are not multiple of each other.
    - `all()` and `any()` can be used to reduce the length of a logical vector to one
  - In contrast, the longer operators (`&&`, `||`) only work on length-one vectors. 
    - The longer form is appropriate for programming control-flow and typically preferred in `if`
clauses.
    - Output is always a vector of length 1.
    - If the length of either vector is not one, currently (R 4.2.1), `Warning: 'length(x) = 2 > 1' in coercion to 'logical(1)'` triggers but after next R release, it will be converted to `Error`.
    - Currently (R 4.2.1), the comparison happen between only the first elements of each vector. 
  - Short-circuit: 
    - R will not evaluate the second operand for `&&` and `||` if it can learn the answer from the first operand (Left First).
    - However, shorter operators (`&`, `|`) do not short-circuit
  - `NA` is similarly handled by both shorter and longer operators
    - If `NA` being either `TRUE` or `FALSE` does not change the outcome, then that value is returned, otherwise `NA` is returned. In that case it can be read as 'cannot be determined'.
    - `isTRUE()` and `isFALSE()` can be used to convert `NA` to `TRUE` or `FALSE`
  - [Refer This](https://www.r-bloggers.com/2021/06/think-of-as-a-stricter/)

- Python uses `and` to indicate `logical AND` and `or` to indicate `logical OR`. 
  - Python uses `&` and `|` for bitwise comparison
  - In Python, `and` and `or` are lazy whereas `&` and `|` are not

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Only the First expression is evaluated if it is enough to determine the result
TRUE | NaN
## [1] TRUE
FALSE & NaN
## [1] FALSE

# Here the Second expression is also evaluated because first is not sufficient
TRUE & NaN
## [1] NA
FALSE | NaN
## [1] NA

# Logical evaluation returns TRUE, FALSE or NA in R (unlike Python)
# 0 is FALSE
3 | NaN
## [1] TRUE
0 & NaN
## [1] FALSE
0 | NaN
## [1] NA
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Only the First expression is evaluated if it is enough to determine the result
True or np.nan
## True
False and np.nan

# Here the Second expression is also evaluated because first is not sufficient
## False
True and np.nan 
## nan
False or np.nan

# Logical evaluation returns the value of final expression evaluated (unlike R)
## nan
3 or np.nan
## 3
True and 3
## 3
```

</div><br></div>

## NULL - None

- `NULL` represents the null object in R: it is a reserved word. NULL is often returned by expressions and functions whose value is undefined. 
  - There is only one null object in memory
  - Inside if condition, `NULL` throws error, use `is.null(x)` syntax
  - If the output of an expression does not show numbers in brackets like '[1]' then it is a NULL type return. [Numbers] show that it is a Vector. Ex: `str()` and `cat()` outputs are of NULL Type.
- Python uses the keyword `None` to define null objects and variables
  - Inside `if` condition, `None` acts as `False`, use `x is None` syntax
  - `None` is a singleton. There is only one `None` in memory
  - [Real Python](https://realpython.com/null-in-python/)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Return of str() is NULL which is passed to print()
print(str("This returns NULL in R"))
##  chr "This returns NULL in R"
## NULL

# Assign NULL
aa <- NULL
# Type
typeof(aa)
## [1] "NULL"
# Check
is.null(aa)
## [1] TRUE
# is.na() returns logical(0) for NULL
is.na(aa)
## logical(0)

# A name pointing to NULL is different from a name which does not exist 'bb'
exists("aa")
## [1] TRUE
exists("bb")
## [1] FALSE
tryCatch(expr = print(bb), error = \(e) print(e))
## <simpleError in print(bb): object 'bb' not found>

# Usage inside if conditional: NULL throws Error, use is.null()
if(is.null(aa)) {
  print("Object is NULL") 
} else {
  print("Object is Not NULL")
}
## [1] "Object is NULL"
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Return of print() is None which is passed to print()
print(print("This returns None in Python"))

# Assign None
## This returns None in Python
## None
pp = None
# Type
type(pp)
# Check
## <class 'NoneType'>
pp is None

# A name pointing to None is different from a name which does not exist 'qq'
## True
'pp' in globals()
## True
'qq' in globals()
## False
try:
    print(qq)
except NameError as e:
    print(e) #e.args type(e)

#
# Usage inside if conditional: None is falsy (taken as FALSE), use 'is None' 
## name 'qq' is not defined
if(pp):
    print("Variable is None")
else:
    print("Variable is Not None")

#
## Variable is Not None
```

</div><br></div>

## Assignment Operator

- Python uses 'equal to' ` = ` as assignment operator 
- R uses 'left arrow' ` <- ` as assignment operator
  - In R, while the ` = ` can be used for assignment, its usage for assignment is highly discouraged because it may behave differently under certain subtle conditions which are difficult to debug
  - Convention is to use ` = `  only during function calls for arguments association (syntactic token)

## Copy Objects or Variables {#copy-p01}

> In R, Everything that exists is an `object`.  
> In R, Everything that happens is a function call.

- Refer [This (SO)](https://stackoverflow.com/questions/34376318)
  - 'Everything' here excludes 'reserved' keywords which can be found by `?reserved`
  - "Everything that exists in R is an `object`" in the sense that it is a kind of data structure that can be manipulated.
    - Think of R objects as collections of data of all kinds. The data contained and the way the data is organized depend on the class from which the object was generated.
    - The key concept is that expressions for evaluation are themselves objects. Evaluation consists of taking the object representing an expression and returning the object that is the value of that expression.

> In Python, Everything is an object.

- It means that 'everything' is an instance of a `class` and (almost) everything has `attributes`
  - 'Everything' here excludes 'reserved' keywords which can be found at [keyword](https://docs.python.org/3/library/keyword.html)

- R uses [Copy-on-Modify](https://adv-r.hadley.nz/names-values.html "https://adv-r.hadley.nz/names-values.html") semantics
  - Effectively it means that the copies are not linked in R. Whereas in Python, sometimes create 'shallow copies' which are linked together i.e. change in one reflects in the other.

- Python mutable and immutable objects
  - `list`, `set`, `dict`, `numpy arrays`, `pandas dataframes` are `mutable`. So, these are modified in-place i.e. append on this will result in modification of the value. Thus, all names pointing to this address will show the new value. `id()` of names would remain the same.
  - `numbers`, `strings`, `bool`, `Tuples`, `Frozen Sets` are `immutable`, so a new object will be created for modifications to apply. Thus, the name (which was used for modification) will now point to a different address containing the new value. `id()` of this name will be different. Other names which were pointing to the original address would keep pointing to the same value, address.
  - Many `numpy` operations modify the array in place.
  - Further, a `tuple` containing a `list` by itself is immutable, however, it contains items which are mutable
  - Further:
    - All manipulations of immutable types create new objects
    - Some manipulations of mutable types create new objects
    - Thus, appending something to the end of a `list` is an in-place mutation (the existing list is changed). But slicing `:` or doubling `*` a list creates new lists.
  - Further, 'pass by object-reference' may result in impact of modification on different object names which were not passed to the function but which were shallow copy of the name that was passed to it.

- If 'fred' & 'george' are two identical items
  - Before any modification both will bind to the same address in R. In Python, both will bind to same address (assigned) or may not bind to same address (shallow /deepcopy of mutable)
  - If 'fred' is modified, in R, 'fred' will bind to a different address. Whereas in Python, 'fred' may bind to the same address (if mutable) or may bind to a different address (immutable)
  - 'george' is not affected in R but in Python, it will be affected (assigned), may be affected (shallow), or may not be affected (deepcopy)

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# R Copy-on-Modify
# Create objects containing value and bind these objects to names
george <- fred <- TRUE

# Before modification both bind to the same memory address (unlike Python)
stopifnot(identical(lobstr::obj_addr(fred), obj_addr(george)))

aa <- obj_addr(fred)                    #Address before modification

fred <- FALSE                           #Modify
fred
## [1] FALSE

stopifnot(obj_addr(fred) != aa)         #Different address (unlike Python)

# No change in unmodified object (george) address or value (same as Python)
stopifnot(obj_addr(george) == aa)
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Mutable
pp = [1, 2]                                       #List
pp = {1, 2}                                       #Set
pp = {'a': 1, 'b': 2}                             #Dict
pp = np.array([1, 2])                             #NumPy Array
pp = pd.DataFrame({'x': [1, 2]})                  #Pandas DataFrame

qq_deep = copy.deepcopy(pp)                       #Deepcopy
ss_copy = copy.copy(pp)                           #Copy
tt_equl = pp                                      #Assignment

if(pp is not qq_deep and pp is not ss_copy and pp is tt_equl): 
    print("Deepcopy & Copy are different from Original but Assigned is same.")

## Deepcopy & Copy are different from Original but Assigned is same.
if(isinstance(pp, list)): pp.append(10)
if(isinstance(pp, set)): pp.add(10)
if(isinstance(pp, dict)): pp.update({'z': 10})
if(isinstance(pp, np.ndarray)): pp += 10 #Update, in-place append is difficult
if(isinstance(pp, pd.DataFrame)): pp.iat[1, 0] = 10

if(pp is tt_equl): 
    print("Original & Assigned are same even after modification.")
## Original & Assigned are same even after modification.
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Immutable
pp = (1, 2)                                       #Tuple
pp = "OldText"                                    #String
pp = 257                                          #Number: >256
pp = True                                         #Bool

qq_deep = copy.deepcopy(pp)                       #Deepcopy
ss_copy = copy.copy(pp)                           #Copy
tt_equl = pp                                      #Assignment

uu = id(pp)                                       #Address before modification

if(pp is qq_deep and pp is ss_copy and pp is tt_equl): 
    print("Deepcopy, Copy, & Assigned all are same as Original Immutable.")

## Deepcopy, Copy, & Assigned all are same as Original Immutable.
if(isinstance(pp, tuple)): pp += (10, )
if(isinstance(pp, str)): pp += "Appended"
if(type(pp) is int): pp += 1
if(type(pp) is bool): pp = False

if(id(pp) != uu and qq_deep is ss_copy and qq_deep is tt_equl): 
    print("Address for Original has been changed but not for others.")
## Address for Original has been changed but not for others.
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = [[1, 1, 1], [2, 2, 2], [3, 3, 3]]            #Nested List

qq_deep = copy.deepcopy(pp)                       #Deepcopy
ss_copy = copy.copy(pp)                           #Copy
tt_equl = pp                                      #Assignment

pp.append([4, 4, 4])                              #Append
pp[1][1] = 100                                    #Update

# is(): True for Assigned, False for Shallow & DeepCopy
# Element addresses: Match for Shallow but Different for DeepCopy
# Append reflects in Assigned but not in Shallow & DeepCopy
# Update reflects in Assigned & Shallow but not in DeepCopy
assert(pp is not qq_deep and pp is not ss_copy and pp is tt_equl and
    len(pp) != len(qq_deep) and len(pp) != len(ss_copy) and
    [id(i) for i in pp[:3]] == [id(i) for i in ss_copy[:3]] and 
    [id(i) for i in pp[:3]] != [id(i) for i in qq_deep[:3]])

print(tt_equl)                                    #Assigned: Appended & Updated
## [[1, 1, 1], [2, 100, 2], [3, 3, 3], [4, 4, 4]]
print(ss_copy)                                    #Shallow : Only Updated
## [[1, 1, 1], [2, 100, 2], [3, 3, 3]]
print(qq_deep)                                    #Deepcopy: No Change
## [[1, 1, 1], [2, 2, 2], [3, 3, 3]]
```

</div><br></div>


## Reticulate Type conversion

- Refer Table \@ref(tab:P01T01) for conversion rules
  - Python variables are available to R as the elements of `py` object 
  - R objects are available to Python as the elements of `r` class

Table: (\#tab:P01T01) (P01T01) Reticulate Type conversion

| R | Python |
| :--- | :--- | 
| Single element vector | Scalar |
| Multi element vector | List |
| List of multiple types | Tuple |
| Named List, R Environment | Dictionary |
| R Environment | Set |
| Matrix or Array | NumPy ndarray |
| Data Frame | Pandas Data Frame |


## Setup Python with Reticulate in R

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE) {
  # In R package::reticulate handles Python
  library("reticulate")
  
  # Provide the path to the specific Python binary.
  use_python("C:\\Softwares\\Python\\Python310\\python.exe", required = TRUE)
  
  # PATH: C:\Softwares\Python\Python310\python.exe
  Sys.which("python")
}
```

</div><br></div>

## Working Directory

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
getwd()             # Working Directory
## [1] "D:/Analytics/PYxR"
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
os.getcwd()         # Working Directory
## 'D:\\Analytics\\PYxR'
```

</div><br></div>

## Verify R & Python Installation

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
strsplit(R.version.string, " ")[[1]][3]           # R Version
## [1] "4.2.1"

# The loaded packages and namespaces are searched before the libraries
packageVersion("knitr")                           # Package Version: knitr
## [1] '1.39'
```

</div><br></div>

- Python (in PowerShell Terminal)
  - If the cmd can locate python correctly but PowerShell cannot, then execute following  
    - `$env:path="$env:Path;C:\Softwares\Python\Python310"`
  - If the python command leads to Microsoft Store
    - Windows | Start | Manage app execution aliases | Disable two for 'python.exe' and 'python3.exe'
    - It hides access to the actual exe PATH because it comes before the actual 
  - The executable gives different path depending upon from where it is being executed
    - Python: `C:\\Softwares\\Python\\Python310`
    - Local RMarkdown: `C:\\Program Files\\RStudio\\bin`
    - Knit: `C:\\PROGRA~1\\R\\R-42~1.1\\bin\\x64`


```bash
# Check, in BASH, if the python has been installed 
python --version

# PATH
where.exe python

# Get the pip Version
bool_as_str=true;
if [[ "$bool_as_str" == "true" ]]; then pip --version; fi

## Python 3.10.5
## C:\Softwares\Python\Python310\python.exe
## pip 22.1.2 from C:\Softwares\Python\Python310\lib\site-packages\pip (python 3.10)
```


```python
# Sys Executable Path
os.path.dirname(sys.executable)
## 'C:\\PROGRA~1\\R\\R-42~1.1\\bin\\x64'
print(sys.version.split()[0])           # Python Version
## 3.10.5
print(pd.__version__)                   # Module Version: pandas
## 1.4.3
```

## Install & Update of R Packages and Python Modules

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE) {
  # Install R Packages  
  install.packages("knitr", dependencies = TRUE)
  
  # Find whether a package is installed or not (slow)
  installed.packages() |> rownames() |> is.element(el = "knitr", set = _)
  
  # Version of installed package (not loaded)
  installed.packages()["knitr", "Version"]
}
```

</div><br></div>

- R: Use HMI
  - RStudio | Tools | Check for Package Updates | Select | Install Updates
    - Packages which are 'loaded via a namespace' by RStudio on start-up (e.g. `knitr`), can be updated in R
  - R | Packages | Update Packages | Select | OK
    - Packages which are bundled with R (e.g. `MASS`), can be updated by starting R in Administrator Mode.

- Python: Use `pip` (in a PowerShell Terminal)
  - Install modules : `pip install pandas`
  - Upgrade `pip` itself : `python -m pip install --upgrade pip`
  - Upgrade other modules :
    - Get a List of Outdated Modules in Freeze Format, split to get only Module Names, upgrade
    - `pip list --outdated --format=freeze | %{$_.split("==")[0]} #| %{pip install --upgrade $_}`
    - Note: Upgrade step of the pipe has been commented out to prevent accidents.
  - Find whether a module is installed or not : `pip list | grep pandas`

## Attach an R Package & Load a Python Module

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE) {
  # Attach an R Package
  library(knitr)
  
  # Attach multiple R Packages
  c("reticulate", "knitr") |> lapply(library, character.only = TRUE)
  
  # List all attached Packages
  print(.packages())
}
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
if(False):
    # Load a Python Module
    import sys
    import pandas as pd
    import numpy as np
    
    # Load multiple Python Modules
    import sys, pandas as pd, numpy as np
    
    # List all imported Modules
    # Works except the implicit import: 'from x import y' (avoid this)
    # Use k to list alias or use v.__name__ to list actual module names
    allmodules = [v.__name__ for k, v in globals().items() 
        if type(v) is types.ModuleType and not k.startswith('__')]
    
    len(allmodules)
    
    ", ".join(allmodules)
```

</div><br></div>

## R sessionInfo()

- R `sessionInfo()` provides a quick look at OS, locale, and the packages loaded
- Python does not have similar in-built method. However,
  - `pip list` can be used along with `globals()`
  - Module `session_info` attempts to provide similar output

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(FALSE) {
  # List of all attached packages and OS related information
  sessionInfo()
  
  # Base Packages
  aa <- c("stats","graphics","grDevices","datasets","utils","methods","base")
  stopifnot(identical(setdiff(sessionInfo()$basePkgs, aa), character(0)))
  
  # other attached packages
  names(sessionInfo()$otherPkgs)
  
  # loaded via a namespace (and not attached)
  names(sessionInfo()$loadedOnly)
}
```

</div><br></div>




## Verify

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
ls()
## [1] "aa"     "fred"   "george" "q_"     "q_link" "q_url"  "r"
```

</div><br></div>
