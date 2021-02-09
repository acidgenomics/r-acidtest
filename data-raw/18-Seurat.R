suppressPackageStartupMessages({
    library(usethis)
    library(pryr)
    library(reticulate)
    library(Seurat)
    library(basejump)
    library(pointillism)
})

## Restrict object size to 1 MB.
limit <- structure(1e6, class = "object_size")

## umap-learn@0.5.0 conda environment warning:
## Now we're ready to check and see if UMAP is available.
## New warning: Tensorflow not installed; ParametricUMAP will be unavailable.
## Consider adding tensorflow to the bioconda recipe?
## > use_condaenv(condaenv = "umap-learn@0.5.0", required = TRUE)
## https://github.com/conda-forge/umap-learn-feedstock/issues/29

## NOTE Need to add tensorflow 2.3.2 (Python 3.8) to Bioconda first, then
## add this to the umap-learn recipe to better support 0.5.0 update.

use_condaenv(condaenv = "umap-learn@0.4.6", required = TRUE)
py_config()
## nolint start
## macOS 10.15.7 (2021-01-14):
##
## python:         /opt/koopa/app/conda/4.9.2/envs/umap-learn@0.4.6/bin/python
## libpython:      /opt/koopa/app/conda/4.9.2/envs/umap-learn@0.4.6/lib/libpython3.8.dylib
## pythonhome:     /opt/koopa/app/conda/4.9.2/envs/umap-learn@0.4.6:/opt/koopa/app/conda/4.9.2/envs/umap-learn@0.4.6
## version:        3.8.6 | packaged by conda-forge | (default, Dec 26 2020, 04:50:20)  [Clang 11.0.0 ]
## numpy:          /opt/koopa/app/conda/4.9.2/envs/umap-learn@0.4.6/lib/python3.8/site-packages/numpy
## numpy_version:  1.19.5
## nolint end
stopifnot(py_module_available(module = "umap"))

## Location of example data moved from Seurat to SeuratObject in v4.0.
data(pbmc_small, package = "SeuratObject")

## The Seurat wiki describes the changes in v3.0+.
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
    level = "genes",
    genomeBuild = "GRCh37",
    ignoreVersion = TRUE
)
rowRanges <- as(rowRanges, "GRanges")
x <- rownames(Seurat)
table <- make.unique(as.character(rowRanges$geneName))
names(rowRanges) <- table
stopifnot(all(x %in% table))
which <- match(x = x, table = table)
rowRanges <- rowRanges[which]
rowRanges <- droplevels(rowRanges)
stopifnot(object_size(rowRanges) < limit)
## FIXME THIS IS DEFINED IN POINTILLISM...
rowRanges(Seurat) <- rowRanges

object_size(Seurat)
stopifnot(object_size(Seurat) < limit)
validObject(Seurat)

use_data(Seurat, compress = "xz", overwrite = TRUE)
