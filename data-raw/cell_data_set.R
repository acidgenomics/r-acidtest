## cell_data_set example
## Updated 2019-11-06.

## This is currently failing to save with Bioconductor 3.10, due to changes in
## SingleCellExperiment that now cause validity checks to fail.
## See related issue on GitHub:
## https://github.com/cole-trapnell-lab/monocle3/issues/246

## See also:
## - https://cole-trapnell-lab.github.io/monocle3/monocle3_docs/
## - https://github.com/cole-trapnell-lab/monocle3/blob/master/examples/
##       c_elegans_L2.R
## - https://github.com/cole-trapnell-lab/monocle3/blob/master/examples/
##       c_elegans_embryo.R

library(usethis)     # 1.5.1
library(pryr)        # 0.1.4
library(magrittr)    # 1.5
library(reticulate)  # 1.13
library(goalie)      # 0.4.0
library(basejump)    # 0.11.20
library(Matrix)      # 1.2-17
library(monocle3)    # 0.2.0
library(dplyr)       # 0.8.3

cores <- getOption("mc.cores")

virtualenv_list()
## [1] "base"    "r-reticulate"

use_virtualenv(virtualenv = "r-reticulate", required = TRUE)

py_config()

## Azure VM
##
## python:         /home/mike/.virtualenvs/r-reticulate/bin/python
## libpython:      /usr/local/koopa/cellar/python/3.8.0/lib/libpython3.8.so
## pythonhome:     /usr/local/koopa/cellar/python/3.8.0:/usr/local/koopa/cellar/python/3.8.0
## version:        3.8.0 (default, Oct 16 2019, 11:45:19)  [GCC 4.8.5 20150623 (Red Hat 4.8.5-39)]
## numpy:          /home/mike/.virtualenvs/r-reticulate/lib/python3.8/site-packages/numpy
## numpy_version:  1.17.3
##
## NOTE: Python version was forced by use_python function

## Restrict object size to 2 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(2e6, class = "object_size")

## Load data ===================================================================
prefix <- "http://staff.washington.edu/hpliner/data"

expression_data <- readRDS(url(file.path(prefix, "cao_l2_expression.rds")))
## > cell_metadata <- readRDS(url(file.path(prefix, "cao_l2_colData.rds")))
gene_metadata <- readRDS(url(file.path(prefix, "cao_l2_rowData.rds")))

head(colnames(expression_data))
## This is bad, don't allow `-` in the names.
## [1] "cele-001-001.CATGACTCAA" "cele-001-001.AAGACGGCCA"
## [3] "cele-001-001.GCCAACGCCA" "cele-001-001.ATAGGAGTAC"
## [5] "cele-001-001.CTCGTCTAGG" "cele-001-001.AAGTTGCCAT"

## Make the dimnames valid before proceeding.
expression_data <- makeDimnames(expression_data)

assert(
    hasValidDimnames(expression_data),
    hasValidDimnames(gene_metadata)
)

## Example cell metadata contains cluster mappings, so skip loading that.
cds <- new_cell_data_set(
    expression_data = expression_data,
    ## cell_metadata = cell_metadata,
    gene_metadata = gene_metadata
)

## Subset to include only the top cells and genes by number of reads.
counts <- counts(cds)

topGenes <- counts %>%
    Matrix::rowSums(.) %>%
    sort(decreasing = TRUE) %>%
    head(n = 200L) %>%
    names()
topCells <- counts %>%
    Matrix::colSums(.) %>%
    sort(decreasing = TRUE) %>%
    head(n = 200L) %>%
    names()

cds <- cds[topGenes, topCells]

## Relevel the factors to decrease object size.
rowData(cds) <- droplevels(rowData(cds))
colData(cds) <- droplevels(colData(cds))

slotNames(cds)
##  [1] "preprocess_aux"      "reduce_dim_aux"
##  [3] "principal_graph_aux" "principal_graph"
##  [5] "clusters"            "int_elementMetadata"
##  [7] "int_colData"         "int_metadata"
##  [9] "reducedDims"         "rowRanges"
## [11] "colData"             "assays"
## [13] "NAMES"               "elementMetadata"
## [15] "metadata"

## If you don't specify rowData:
## Warning: gene_metadata must contain a column verbatim named 'gene_short_name'
## for certain functions.

colnames(colData(cds))
## [1] "cell"        "Size_Factor"

## Pre-process the data.
## Note that log normalization of data has come under question as appropriate.
cds <- preprocess_cds(cds)

## Reduce dimensionality.
cds <- reduce_dimension(
    cds = cds,
    reduction_method = "UMAP",
    preprocess_method = "PCA",
    umap.fast_sgd = TRUE,
    cores = cores
)

## Note: reduce_dimension will produce slightly different output each time you
## run it unless you set 'umap.fast_sgd = FALSE' and 'cores = 1'

## Group cells into clusters.
cds <- cluster_cells(
    cds = cds,
    reduction_method = "UMAP",
    k = 20L,
    louvain_iter = 1L,
    partition_qval = 0.05,
    weight = FALSE,
    resolution = c(10L ^ seq(from = -6L, to = -1L)),
    verbose = TRUE
)

## Clusters are currently located in cds@clusters
## cds@clusters[["UMAP"]]

## Order cells in pseudotime along a trajectory.
## This step takes a while for large datasets.
cds <- learn_graph(
    cds = cds,
    use_partition = TRUE,
    close_loop = TRUE,
    verbose = TRUE
)

object_size(cds)
lapply(coerceS4ToList(cds), object_size)
stopifnot(object_size(cds) < limit)

cell_data_set <- cds
use_data(cell_data_set, compress = "xz", overwrite = TRUE)
