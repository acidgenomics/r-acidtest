# acidtest

[![Travis CI build status](https://travis-ci.com/acidgenomics/acidtest.svg?branch=master)](https://travis-ci.com/acidgenomics/acidtest)
[![AppVeyor CI build status](https://ci.appveyor.com/api/projects/status/or2o22215alx5xy8/branch/master?svg=true)](https://ci.appveyor.com/project/mjsteinbaugh/acidtest/branch/master)
[![Repo status: active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

Reference data for unit testing from [Acid Genomics].

## Installation

### [Bioconductor][] method

We recommend installing the package with [BiocManager][].

```r
if (!require("BiocManager")) {
    install.packages("BiocManager")
}
BiocManager::install("remotes")
BiocManager::install("acidgenomics/acidtest")
```

[Acid Genomics]: https://acidgenomics.com/
[Bioconductor]: https://bioconductor.org/
[BiocManager]: https://cran.r-project.org/package=BiocManager
[R]: https://www.r-project.org/
