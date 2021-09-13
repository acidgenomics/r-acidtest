## FIXME Can we update UMAP to latest version here?

suppressPackageStartupMessages({
    library(usethis)
    library(lobstr)
    library(basejump)
    library(reticulate)
    library(Seurat)
    library(pointillism)
})
## Restrict object size to 1 MB.
limit <- structure(1e6, class = "object_size")
use_condaenv(condaenv = "umap-learn@0.5.1", required = TRUE)
py_config()
## nolint start
## macOS 11.5.2 (2021-09-13):
##
## python:         /opt/koopa/app/conda/4.10.3/envs/umap-learn@0.5.1/bin/python
## libpython:      /opt/koopa/app/conda/4.10.3/envs/umap-learn@0.5.1/lib/libpython3.9.dylib
## pythonhome:     /opt/koopa/app/conda/4.10.3/envs/umap-learn@0.5.1:/opt/koopa/app/conda/4.10.3/envs/umap-learn@0.5.1
## version:        3.9.7 | packaged by conda-forge | (default, Sep  2 2021, 17:58:46)  [Clang 11.1.0 ]
## numpy:          /opt/koopa/app/conda/4.10.3/envs/umap-learn@0.5.1/lib/python3.9/site-packages/numpy
## numpy_version:  1.20.3
## nolint end
stopifnot(py_module_available(module = "umap"))
## Location of example data moved from Seurat to SeuratObject in v4.0.
data(pbmc_small, package = "SeuratObject")
## The Seurat wiki describes the changes in v3.0+.
## https://github.com/satijalab/seurat/wiki
Seurat <- UpdateSeuratObject(pbmc_small)
stopifnot(obj_size(Seurat) < limit)
## Add UMAP dimensional reduction to example object.
## Alternatively, can use `features` here instead.
## NOTE This step can crash R when using `umap.method = "umap-learn` with
## umap-learn v0.5.1.
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
stopifnot(obj_size(rowRanges) < limit)
## NOTE This method is defined in pointillism.
rowRanges(Seurat) <- rowRanges
stopifnot(obj_size(Seurat) < limit)
validObject(Seurat)
use_data(Seurat, compress = "xz", overwrite = TRUE)
