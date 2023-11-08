#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data simulated
#' by the splatter package.
#'
#' @note Updated 2022-03-07.
#' @usage data(SingleCellExperiment_splatter)
#' @return `SingleCellExperiment`.
#'
#' @seealso
#' - `splatter::splatSimulate()`.
#' - `data(sc_example_counts, package = "scater")`.
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(SingleCellExperiment_splatter)
#'     class(SingleCellExperiment_splatter)
#'     print(SingleCellExperiment_splatter)
#' }
"SingleCellExperiment_splatter"
