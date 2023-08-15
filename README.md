# AcidTest

![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)

Reference data for [Acid Genomics][] unit tests.

## Installation

This is an [R][] package.

```r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}
install.packages(
    pkgs = "AcidTest",
    repos = c(
        "https://r.acidgenomics.com",
        BiocManager::repositories()
    ),
    dependencies = TRUE
)
```

[acid genomics]: https://acidgenomics.com/
[r]: https://www.r-project.org/
