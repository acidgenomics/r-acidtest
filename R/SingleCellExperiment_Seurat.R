#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @seealso
#' - `Seurat::pbmc_small`.
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment_Seurat)
#'     class(SingleCellExperiment_Seurat)
#'     SingleCellExperiment_Seurat
#' }
"SingleCellExperiment_Seurat"
