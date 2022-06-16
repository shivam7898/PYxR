# Introduction {#introduction-p01}



## Similarity between R and Python

- Both R and Python are case-sensitive
- Both R and Python use the Hash Sign "#" to comment out anything after it, till the newline
- Both R and Python keep the Backslash "\\" as reserved to escape the character that follows it
- 

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
## [1] "0x14a7a8ef880"
obj_addr(bb)
## [1] "0x14a7a8ef880"
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
# Now the copy (modified) points to a different memory address than earlier
obj_addr(bb)
## [1] "0x14a7a8ef6c0"
# Original is still pointing to the same address containing original object
obj_addr(aa)
## [1] "0x14a7a8ef880"
```


```python
# Create a variable containing a value and bind that variable to name 'pp'
pp = 10 
# Copy a variable i.e. Create another binding to an already existing value
qq = pp
# Note that both names are pointing to same memory address
id(pp)
## 1419458445840
id(qq)

# Print the copy
## 1419458445840
print(qq)
# Modify the copy
## 10
qq = 5
# Print the copy and the original (original is unmodified)
print(qq)
## 5
print(pp)
# Now the copy (modified) points to a different memory address than earlier
## 10
id(qq)
# Original is still pointing to the same address containing original variable
## 1419458445680
id(pp)
## 1419458445840
```

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
