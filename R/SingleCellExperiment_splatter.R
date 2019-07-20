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
#'     data(SingleCellExperiment_splatter)
#'     class(SingleCellExperiment_splatter)
#'     SingleCellExperiment_splatter
#' }
"SingleCellExperiment_splatter"
