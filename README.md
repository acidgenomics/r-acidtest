# AcidTest

[![Install with Bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg)](https://bioconda.github.io/recipes/r-acidtest/README.html) ![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)

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

### [Conda][] method

Configure [Conda][] to use the [Bioconda][] channels.

```sh
# Don't install recipe into base environment.
name='r-acidtest'
conda create --name="$name" "$name"
conda activate "$name"
R
```

[acid genomics]: https://acidgenomics.com/
[bioconda]: https://bioconda.github.io/
[conda]: https://docs.conda.io/
[r]: https://www.r-project.org/

## License

Apache-2.0 — Copyright 2019 Acid Genomics LLC — see [LICENSE.md](LICENSE.md).
