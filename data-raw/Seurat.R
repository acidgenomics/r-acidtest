## Seurat example object.
## Updated 2019-10-25.

library(usethis)      # 1.5.1
library(pryr)         # 0.1.4
library(basejump)     # 0.11.19
library(reticulate)   # 1.13
library(Seurat)       # 3.1.1
library(pointillism)  # 0.4.2

## umap-learn via reticulate doesn't work well with conda.
## Set up a Python 3 virtual environment instead.
## https://github.com/satijalab/seurat/issues/486


## FIXME Safe to take this out?
## Reticulate looks for `virtualenv` (Python 2) and will error out otherwise.
##
## ```sh
## sudo pip install --upgrade pip
## sudo pip install virtualenv
## ```

## Create virtualenv in shell (preferred):
##
## ```sh
## python3 -m venv ~/.virtualenvs/r-reticulate
## source ~/.virtualenvs/r-reticulate/bin/activate
## pip install --upgrade pip
##
## ## scikit-learn can fail unless we install Cython manually first.
## pip install Cython
##
## pip install numpy
## pip install scikit-learn
## pip install louvain
##
## LLVM 7+ is now required.
##
## RHEL 7-specific:
## sudo yum install -y 'llvm7*'
## export LLVM_CONFIG="/usr/bin/llvm-config-7.0-64"
##
## pip install llvmlite
##
## pip install numba
##
## pip install umap-learn
## deactivate
## ```

## 2019-10-25: Hitting a numba timeout on pypi.org (Azure RHEL)

## Create virtualenv in R (alternate):
##
## ```r
## install.packages("reticulate")
## library(reticulate)
## ## Check for Python 3. Don't continue if this returns Python 2.
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
use_virtualenv(virtualenv = "r-reticulate", required = TRUE)
py_config()

## Should see something like this:
## python:         /home/mike/.virtualenvs/r-reticulate/bin/python
## libpython:      /usr/local/koopa/cellar/python/3.7.4/lib/libpython3.7m.so
## pythonhome:     /usr/local/koopa/cellar/python/3.7.4:/usr/local/koopa/cellar/python/3.7.4
## version:        3.7.4 (default, Jul 30 2019, 18:46:24)  [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)]
## numpy:          /home/mike/.virtualenvs/r-reticulate/lib/python3.7/site-packages/numpy
## numpy_version:  1.17.0
##
## python versions found:
##  /home/mike/.virtualenvs/r-reticulate/bin/python
##  /usr/local/bin/python
##  /usr/bin/python
##  /usr/local/bin/python3

## Now we're ready to check and see if UMAP is available.
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
rowRanges <- rowRanges[which]
rowRanges <- droplevels(rowRanges)
stopifnot(object_size(rowRanges) < limit)
rowRanges(Seurat) <- rowRanges

object_size(Seurat)
stopifnot(object_size(Seurat) < limit)
validObject(Seurat)

use_data(Seurat, compress = "xz", overwrite = TRUE)
