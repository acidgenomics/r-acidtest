# acidtest

[![Repo status: active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Travis CI build status](https://travis-ci.com/acidgenomics/acidtest.svg?branch=master)](https://travis-ci.com/acidgenomics/acidtest)
[![AppVeyor CI build status](https://ci.appveyor.com/api/projects/status/or2o22215alx5xy8/branch/master?svg=true)](https://ci.appveyor.com/project/mjsteinbaugh/acidtest/branch/master)

Reference data for unit testing.

## Installation

This is an [R][] package.

### [R][] method

```r
if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
}
Sys.setenv(R_REMOTES_UPGRADE = "always")
## Set `GITHUB_PAT` in `~/.Renviron` if you get a rate limit error.
remotes::install_github("acidgenomics/acidtest")
remotes::update_packages()
```

[Acid Genomics]: https://acidgenomics.com/
[Bioconductor]: https://bioconductor.org/
[BiocManager]: https://cran.r-project.org/package=BiocManager
[R]: https://www.r-project.org/
