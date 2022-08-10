
# conmat-grant

<!-- badges: start -->
<!-- badges: end -->

# Steps for recreating this

## install capsule

```r
install.packages(
   "capsule", 
   repos = c(mm = "https://milesmcbain.r-universe.dev", getOption("repos")))
```

## reproducible the dependencies

```r
capsule::reproduce_lib()
```

## run targets

```r
capsule::run(targets::tar_make())
```
