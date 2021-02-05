#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @note Updated 2020-01-28.
#' @usage data(SingleCellExperiment)
#' @return `SingleCellExperiment`.
#'
#' @seealso
#' - `splatter::splatSimulate()`.
#' - `data(sc_example_counts, package = "scater")`.
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment)
#'     class(SingleCellExperiment)
#'     SingleCellExperiment
#' }
"SingleCellExperiment"
