# R List & Python Dictionary {#list-dict-p03}



- R `list` :

- Python `dict` (Dictionary) :
  - `dict` : Literal `{}`, Ordered, Mutable, No Duplicates, [Refer](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)

> Dictionaries compare equal if and only if they have the same (key, value) pairs (regardless of ordering).[Refer](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)  

- `dict` is ordered
  - Essentially it means 'insertion ordered' which is different from ordered like `OrderedDict`
  - Equality comparisons with `OrderedDict` are order sensitive but this is not the case for `dict`
- [Refer](https://docs.python.org/3.9/whatsnew/3.9.html#dictionary-merge-update-operators)

## Basic

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
aa = list()                                       #Empty List
str(aa)
##  list()
aa <- list("a" = 11L, "b" = 22L)                   #Normal List
str(aa)
## List of 2
##  $ a: int 11
##  $ b: int 22

bb <- setNames(as.list(c(11L, 22L, 33L)), nm = c("a", "b", "c")) #Named List
str(bb)
## List of 3
##  $ a: int 11
##  $ b: int 22
##  $ c: int 33

# R List equality comparison is order sensitive (unlike Python Dictionary)
dd <- list("b" = 22L, "a" = 11L)
stopifnot(!identical(aa, dd))                     #Order Sensitive
stopifnot(identical(aa[order(names(aa))], dd[order(names(dd))])) #Sort, Compare

ee <- list("c" = 33L, "b" = 999L)
xx <- c(aa, ee)                         #Merge, keep duplicates (Avoid)
str(xx)
## List of 4
##  $ a: int 11
##  $ b: int 22
##  $ c: int 33
##  $ b: int 999
xx <- modifyList(aa, val = ee)          #Merge, overwrite duplicates
str(xx)
## List of 3
##  $ a: int 11
##  $ b: int 999
##  $ c: int 33
xx <- within(xx, rm("b"))               #Delete, Key not found Error
xx[c("b")] <- NULL                      #Delete, No Key error
xx <- xx[setdiff(names(xx), "bb")]      #Delete, No Key error
str(xx)
## List of 2
##  $ a: int 11
##  $ c: int 33

# Merge, overwrite duplicates: This may result in position change of key
str(c(aa, ee)[!duplicated(c(names(aa), names(ee)), fromLast = TRUE)])
## List of 3
##  $ a: int 11
##  $ c: int 33
##  $ b: int 999

ff <- modifyList(aa, val = ee)          #Merge, overwrite duplicates
ff$b <- 22L
stopifnot(identical(bb, ff))
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = {}                                           #Empty Dictionary
print(f"{type(pp) = } | {len(pp) = } | {pp = }")
## type(pp) = <class 'dict'> | len(pp) = 0 | pp = {}
pp = {"a": 11, "b": 22}                           #Normal Dictionary
print(f"{len(pp)=}, {pp = }")
## len(pp)=2, pp = {'a': 11, 'b': 22}
qq = {zip(["a", "b", "c"], [11, 22, 33])}         #zip() creates set with {}
assert(type(qq) is set)
qq = dict(zip(["a", "b", "c"], [11, 22, 33]))     #zip() needs dict()
print(f"{len(qq)=}, {qq = }")

# Python Dictionary equality comparison is order insensitive (unlike R List)
## len(qq)=3, qq = {'a': 11, 'b': 22, 'c': 33}
ss = {"b": 22, "a": 11}
assert(pp == ss)                                  #Ignore Key Position
assert(not(list(ss.items()) == list(pp.items()))) #Consider Key Position

tt = {"c": 33, "b": 999}
pp.update(tt)                           #Merge in-place, Last seen overwrite
print(f"{len(pp)=}, {pp = }")
## len(pp)=3, pp = {'a': 11, 'b': 999, 'c': 33}
pp.update({"b": 22}) 
del pp["c"]                   #Delete in-place, return None, Key not found Error
tt.pop("b")                   #Pop in-place, return value, Key not found Error
## 999
tt.pop("b", None)             #Pop in-place, return value, No Key error
tt["b"] = 999                           #Add element using subscript notation
print(f"{len(pp)=}, {pp = }")
## len(pp)=2, pp = {'a': 11, 'b': 22}
print(f"{len(tt)=}, {tt = }")
## len(tt)=2, tt = {'c': 33, 'b': 999}
uu = {**pp, **tt, **{"b": 22}}          #Merge using **, Last seen overwrite
assert(qq == uu)

vv = pp | tt | {"b": 22}                #Merge using | , Last seen overwrite
assert(qq == vv)
#print(f"{len(uu)=}, {uu = }")
#print(f"{len(vv)=}, {vv = }")

ww = copy.deepcopy(pp)
ww |= tt                      #Update in-place using |= , Last seen overwrite
ww |= {"b": 22}
assert(qq == ww)
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#4C78DB"><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
bb_y <- py$qq
str(bb_y)
## List of 3
##  $ a: int 11
##  $ b: int 22
##  $ c: int 33
stopifnot(identical(bb, bb_y))
```

</div><br></div>

<div class=decocode><div style="background-color:inherit"><span style="font-size:100%;color:#FFD94C"><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
qq_r = r.bb
print(f"{len(qq_r)=}, {qq_r = }")
## len(qq_r)=3, qq_r = {'a': 11, 'b': 22, 'c': 33}
assert(qq == qq_r)
```

</div><br></div>

## Nested



## Compare


