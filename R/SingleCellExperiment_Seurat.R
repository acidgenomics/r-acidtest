#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @note Updated 2022-03-04.
#' @usage data(SingleCellExperiment_Seurat)
#' @return `SingleCellExperiment`.
#'
#' @seealso
#' ```r
#' `data(pbmc_small, package = "Seurat")`.
#' ```
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment_Seurat)
#'     class(SingleCellExperiment_Seurat)
#'     SingleCellExperiment_Seurat
#' }
"SingleCellExperiment_Seurat"
