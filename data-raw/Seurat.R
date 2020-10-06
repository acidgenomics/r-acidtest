## Seurat example object.
## Updated 2020-07-24.

library(usethis)
library(pryr)         # 0.1.4
library(basejump)     # 0.12.9
library(reticulate)   # 1.16
library(Seurat)       # 3.2.0
library(pointillism)  # 0.4.12

## umap-learn via reticulate doesn't work well with conda.
## Set up a Python 3 virtual environment instead.
## https://github.com/satijalab/seurat/issues/486

## Create virtualenv in shell (preferred):
##
## ```sh
## venv-create-r-reticulate (from koopa)
## ```

## Create virtualenv in R (alternate):
##
## ```r
## install.packages("reticulate")
## library(reticulate)
## ## Check for Python 3.
## py_config()
## virtualenv_create(envname = "r-reticulate")
## virtualenv_install(
##     envname = "r-reticulate",
##     packages = c("louvain", "umap-learn")
## )
## virtualenv_list()
## ```

## Check and make sure Python umap-learn is accessible to run UMAP.
## We're using this in the `Seurat::RunUMAP()` call below.
virtualenv_list()
# [1] "r-reticulate"
use_virtualenv(virtualenv = "r-reticulate", required = TRUE)
py_config()

## macOS 10.14.6 (2020-01-18):
##
## python:         /usr/local/koopa/opt/python/virtualenvs/r-reticulate/bin/python
## libpython:      /usr/local/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/lib/python3.8/config-3.8-darwin/libpython3.8.dylib
## pythonhome:     /usr/local/Cellar/python@3.8/3.8.5/Frameworks/Python.framework/Versions/3.8:/usr/local/Cellar/python@3.8/3.8.5/Frameworks/Python.framework/Versions/3.8
## version:        3.8.5 (default, Jul 21 2020, 10:48:26)  [Clang 11.0.3 (clang-1103.0.32.62)]
## numpy:          /usr/local/koopa/opt/python/virtualenvs/r-reticulate/lib/python3.8/site-packages/numpy
## numpy_version:  1.19.1
## leidenalg:      [NOT FOUND]

## Now we're ready to check and see if UMAP is available.
stopifnot(py_module_available(module = "umap"))

## Restrict object size to 1 MB.
limit <- structure(1e6, class = "object_size")

data(pbmc_small, package = "Seurat")

## The Seurat wiki describes the changes in v3.0.
## https://github.com/satijalab/seurat/wiki
Seurat <- UpdateSeuratObject(pbmc_small)
object_size(Seurat)
stopifnot(object_size(Seurat) < limit)

## Add UMAP dimensional reduction to example object.
## Alternatively, can use `features` here instead.
Seurat <- RunUMAP(
    object = Seurat,
    ## Note that this now defaults to "uwot" in Seurat 3.1.
    umap.method = "umap-learn",
    dims = seq_len(10L)
)

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
rowRanges <- rowRanges[which]
rowRanges <- droplevels(rowRanges)
stopifnot(object_size(rowRanges) < limit)
rowRanges(Seurat) <- rowRanges

object_size(Seurat)
stopifnot(object_size(Seurat) < limit)
validObject(Seurat)

use_data(Seurat, compress = "xz", overwrite = TRUE)
