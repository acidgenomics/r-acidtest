#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @note Updated 2020-01-28.
#' @return `SingleCellExperiment`.
#' @seealso
#' - `data(pbmc_small, package = "Seurat")`.
#' @usage data(SingleCellExperiment_Seurat)
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment_Seurat)
#'     class(SingleCellExperiment_Seurat)
#'     SingleCellExperiment_Seurat
#' }
"SingleCellExperiment_Seurat"
