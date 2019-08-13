library(usethis)
library(pryr)
library(reticulate)
library(Matrix)
library(splatter)
library(Seurat)  # 3.0
library(bcbioSingleCell)
library(tidyverse)

## Create virtualenv in shell:
##
## ```sh
## > python3 -m venv ~/.virtualenvs/reticulate
## > source ~/.virtualenvs/reticulate/bin/activate
## > pip install --upgrade pip
## > pip install louvain umap-learn
## > deactivate
## ```
##
## Create virtualenv in R:
##
## ```r
## > install.packages("reticulate")
## > library(reticulate)
## > virtualenv_create(envname = "r-reticulate")
## > virtualenv_install(
## >     envname = "r-reticulate",
## >     packages = c("louvain", "umap-learn")
## > )
## ```

## Check and make sure Python umap-learn is accessible to run UMAP.
## We're using this in the `Seurat::RunUMAP()` call below.
##
## umap-learn via reticulate doesn't work well with conda.
## Set up a Python 3 virtual environment instead.
## https://github.com/satijalab/seurat/issues/486
##
## Can also set `RETICULATE_PYTHON` to python binary in `~/.Renviron`.
## Use python3 installed at `/usr/local/bin/python3`.

virtualenv_list()
use_virtualenv(virtualenv = "reticulate", required = TRUE)
py_config()
stopifnot(py_module_available(module = "umap"))

## Restrict object size to 1 MB.
limit <- structure(1e6, class = "object_size")

data(pbmc_small, package = "Seurat")
object_size(pbmc_small)
stopifnot(object_size(pbmc_small) < limit)

## The Seurat wiki describes the changes in v3.0.
## https://github.com/satijalab/seurat/wiki
Seurat <- pbmc_small

## Add UMAP dimensional reduction to example object.
## Alternatively, can use `features` here instead.
Seurat <- RunUMAP(Seurat, dims = seq_len(10L))

## Slot row ranges into the Seurat object.
rowRanges <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    genomeBuild = "GRCh37"
)
x <- rownames(Seurat)
table <- make.unique(as.character(rowRanges$geneName))
names(rowRanges) <- table
stopifnot(all(x %in% table))
which <- match(x = x, table = table)
rowRanges <- rowRanges[which] %>% relevelRowRanges()
stopifnot(object_size(rowRanges) < limit)
rowRanges(Seurat) <- rowRanges

object_size(Seurat)
stopifnot(object_size(Seurat) < limit)
validObject(Seurat)

use_data(Seurat, compress = "xz", overwrite = TRUE)
