# acidData

[![Travis CI build status](https://travis-ci.com/acidgenomics/acidData.svg?branch=master)](https://travis-ci.com/acidgenomics/acidData)
[![AppVeyor CI build status](https://ci.appveyor.com/api/projects/status/or2o22215alx5xy8/branch/master?svg=true)](https://ci.appveyor.com/project/mjsteinbaugh/aciddata/branch/master)
[![Repo status: active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

Example minimal datasets for bioinformatics from [Acid Genomics].

## Installation

### [Bioconductor][] method

We recommend installing the package with [BiocManager][].

```r
if (!require("BiocManager")) {
    install.packages("BiocManager")
}
BiocManager::install("remotes")
BiocManager::install("acidgenomics/acidData")
```

[Acid Genomics]: https://acidgenomics.com/
[Bioconductor]: https://bioconductor.org/
[BiocManager]: https://cran.r-project.org/package=BiocManager
[R]: https://www.r-project.org/
