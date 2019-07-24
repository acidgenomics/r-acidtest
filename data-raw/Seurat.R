library(usethis)
library(pryr)
library(reticulate)
library(Matrix)
library(splatter)
library(Seurat)  # 3.0
library(bcbioSingleCell)
library(tidyverse)

## ```sh
## $ source ~/.virtualenvs/reticulate/bin/activate
## $ pip install --upgrade pip
## $ pip install umap-learn
## $ deactivate
## ```

## Check and make sure Python umap-learn is accessible to run UMAP.
## We're using this in the `Seurat::RunUMAP()` call below.
##
## umap-learn via reticulate doesn't work well with conda.
## Set up a Python 3 virtual environment instead.
## https://github.com/satijalab/seurat/issues/486
##
## Can also set `RETICULATE_PYTHON` to python binary in `~/.Renviron`.

virtualenv_list()
## [1] "reticulate"

## > source ~/.virtualenvs/reticulate/bin/activate
use_virtualenv(virtualenv = "reticulate", required = TRUE)

py_config()

## [Azure]
## python:         /home/mike/.virtualenvs/reticulate/bin/python
## libpython:      /usr/local/koopa/cellar/python/3.7.3/lib/libpython3.7m.so
## pythonhome:     /usr/local/koopa/cellar/python/3.7.3:/usr/local/koopa/cellar/python/3.7.3
## version:        3.7.3 (default, Jun 24 2019, 13:12:54)  [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)]
## numpy:          /home/mike/.virtualenvs/reticulate/lib/python3.7/site-packages/numpy
## numpy_version:  1.16.4

stopifnot(py_module_available(module = "umap"))

## Restrict object size to 1 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
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
