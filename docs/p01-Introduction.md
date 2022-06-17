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
## [1] "0x1fbb1638a48"
obj_addr(bb)
## [1] "0x1fbb1638a48"
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
## [1] "0x1fbb1638888"
# Original is still pointing to the same address containing original object
obj_addr(aa)
## [1] "0x1fbb1638a48"
```


```python
# Create a variable containing a value and bind that variable to name 'pp'
pp = 10 
# Copy a variable i.e. Create another binding to an already existing value
qq = pp
# Note that both names are pointing to same memory address
id(pp)
## 2180568121872
id(qq)
## 2180568121872
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
## 2180568121712
id(pp)
## 2180568121872
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
print(sys.version)
## 3.10.5 (tags/v3.10.5:f377153, Jun  6 2022, 16:14:13) [MSC v.1929 64 bit (AMD64)]
```


```r
ls()
## [1] "aa" "bb" "r"
```
