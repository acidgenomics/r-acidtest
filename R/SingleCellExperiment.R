#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @seealso
#' - `splatter::splatSimulate()`.
#' - `scater::sc_example_counts`.
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment)
#'     class(SingleCellExperiment)
#'     SingleCellExperiment
#' }
"SingleCellExperiment"
