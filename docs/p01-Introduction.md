# Introduction {#introduction-p01}



## Similarity between R and Python

- Both R and Python are case-sensitive
- Both R and Python use the Hash Sign "#" to comment out anything after it, till the newline
- Both R and Python keep the Backslash "\\" as reserved to escape the character that follows it


## Differences between R and Python

### Indentation

- Indentation and white spaces are extremely significant in Python (unlike R)
  - 4 Spaces (not Tab) are being used, in this book, for Python chunks
  - A backslash "\\" allows you to break up one long piece of code into several parts
  - Any character (including whitespace) after the backslash will cause an error
  - Parentheses "()" can be used to enclose all of the code. Parentheses work like the backslash, but allow extra characters at the end
  - An extra newline is being added in Python chunks, in this book, to indicate that the command /block has been completed

### Boolean

- R (TRUE, FALSE) vs. Python (True, False) - Case is different

### NULL & None

- `NULL` represents the null object in R: it is a reserved word. NULL is often returned by expressions and functions whose value is undefined. 
  - There is only one null object in memory
  - Inside if condition, NULL throws error, use 'is.null(x)' syntax
- Python uses the keyword `None` to define null objects and variables
  - Inside if condition, None acts as False, use 'x is None' syntax
  - None is a singleton. There is only one None in memory
  - [Real Python](https://realpython.com/null-in-python/)

<div class=decocode><div style="background-color:#4C78DB"><span style="font-size:100%;color:#ffffff"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#ffffff;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

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

# A name pointing to NULL is different from a name which does not exist 'bb'
exists("aa")
## [1] TRUE
exists("bb")
## [1] FALSE
tryCatch(expr = print(bb), error = \(e) print(e))
## <simpleError in print(bb): object 'bb' not found>

# Usage inside if conditional: NULL throws Error, use is.null()
if(is.null(aa)) {
  print("IF Block") 
} else {
  print("ELSE Block")
}
## [1] "IF Block"
```

</div><br></div>

<div class=decocode><div style="background-color:#417FB1"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

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
    print("IF Block")
else:
    print("ELSE Block")

#
## ELSE Block
```

</div><br></div>


### Indexing

- Indexing starts at 1 in R. Whereas, it starts at 0 in Python

### Pipe

- Python uses dot "." as pipe operator
- R uses "|>" as pipe operator along with underscore "_" as placeholder
  - To minimize the issues, in this book, underscore will be used (and dot will be avoided) in names of objects or variables names

### Assignment Operator

- Python uses 'equal to' " = " as assignment operator 
- R uses equal to " <- " as assignment operator
  - In R, while the " = " can be used for assignment, its usage for assignment is highly discouraged because it may behave differently under certain subtle conditions which are difficult to debug
  - Convention is to use " = " only during function calls for arguments association (syntactic token)

### Copy Objects or Variables

- R [Advanced R, Hadley](https://adv-r.hadley.nz/names-values.html "https://adv-r.hadley.nz/names-values.html")

- Python Similar but different
  

```r
# Load Packages: "lobstr"
# Create an object containing a value and bind that object to name 'aa'
aa <- 10 
# Copy an object i.e. Create another binding to an already existing value
bb <- aa
# Note that both names are pointing to same memory address
obj_addr(aa)
## [1] "0x26ed0235ee0"
obj_addr(bb)
## [1] "0x26ed0235ee0"
stopifnot(identical(obj_addr(aa), obj_addr(bb)))

# Print the copy
print(bb)
## [1] 10
# Modify the copy
bb <- 5
# Print the copy and the original (original is unmodified)
print(bb)
## [1] 5
print(aa)
## [1] 10
# Now the modified name points to a different memory address than earlier
obj_addr(bb)
## [1] "0x26ed0235d58"
# Original is still pointing to the same address containing original object
obj_addr(aa)
## [1] "0x26ed0235ee0"
```


```python
# Create a variable containing a value and bind that variable to name 'pp'
pp = 10 
# Copy a variable i.e. Create another binding to an already existing value
qq = pp
# Note that both names are pointing to same memory address
id(pp)
## 2675010175504
id(qq)
## 2675010175504
assert(id(pp) == id(qq))

# Print the copy
print(qq)
# Modify the copy
## 10
qq = 5
# Print the copy and the original (original is unmodified)
print(qq)
## 5
print(pp)
# Now the modified name points to a different memory address than earlier
## 10
id(qq)
# Original is still pointing to the same address containing original variable
## 2675010175344
id(pp)
## 2675010175504
```

### Reticulate Type conversion

- R : Python
- Single element vector : Scalar
- Multi element vector : List
- List of multiple types : Tuple
- Named List : Dictionary
- Matrix /Array : NumPy ndarray
- Data Frame : Pandas Data Frame
- Function: Function
- Raw : Byte array

## Verify


```r
R.version.string
## [1] "R version 4.2.0 (2022-04-22 ucrt)"
```


```python
print(sys.version.split()[0])
## 3.10.5
```


```r
ls()
## [1] "aa" "bb" "r"
```
