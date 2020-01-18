## Seurat example object.
## Updated 2020-01-18.

library(usethis)      # 1.5.1
library(pryr)         # 0.1.4
library(basejump)     # 0.11.24
library(reticulate)   # 1.14
library(Seurat)       # 3.1.2
library(pointillism)  # 0.4.5

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

## Azure RHEL 7 (2019-10-25):
##
## python:         /home/mike/.virtualenvs/r-reticulate/bin/python
## libpython:      /usr/local/koopa/cellar/python/3.8.0/lib/libpython3.8.so
## pythonhome:     /usr/local/koopa/cellar/python/3.8.0:/usr/local/koopa/cellar/python/3.8.0
## version:        3.8.0 (default, Oct 16 2019, 11:45:19)  [GCC 4.8.5 20150623 (Red Hat 4.8.5-39)]
## numpy:          /home/mike/.virtualenvs/r-reticulate/lib/python3.8/site-packages/numpy
## numpy_version:  1.17.3

## macOS 10.14.6 (2020-01-18):
##
## python:         /usr/local/python/virtualenvs/r-reticulate/bin/python
## libpython:      /Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/config-3.8-darwin/libpython3.8.dylib
## pythonhome:     /Library/Frameworks/Python.framework/Versions/3.8:/Library/Frameworks/Python.framework/Versions/3.8
## version:        3.8.1 (v3.8.1:1b293b6006, Dec 18 2019, 14:08:53)  [Clang 6.0 (clang-600.0.57)]
## numpy:          /usr/local/python/virtualenvs/r-reticulate/lib/python3.8/site-packages/numpy
## numpy_version:  1.18.1

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
