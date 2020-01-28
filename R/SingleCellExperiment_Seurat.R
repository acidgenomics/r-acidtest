#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @note Updated 2020-01-28.
#'
#' @usage data(SingleCellExperiment_Seurat)
#'
#' @return `SingleCellExperiment`.
#'
#' @seealso
#' - `data(pbmc_small, package = "Seurat")`.
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment_Seurat)
#'     class(SingleCellExperiment_Seurat)
#'     SingleCellExperiment_Seurat
#' }
"SingleCellExperiment_Seurat"
