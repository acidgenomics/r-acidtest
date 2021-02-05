#' Single cell experiment with lane-split technical replicates
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data and
#' lane-split technical replicates.
#'
#' @note Updated 2020-02-05.
#' @usage data(SingleCellExperiment)
#' @return `SingleCellExperiment`.
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment_lanesplit)
#'     class(SingleCellExperiment_lanesplit)
#'     SingleCellExperiment_lanesplit
#' }
"SingleCellExperiment_lanesplit"
