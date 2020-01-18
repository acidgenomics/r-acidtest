#' Cell data set
#'
#' Example monocle3 `cell_data_set` object.
#'
#' @note Updated 2020-01-18.
#'
#' @examples
#' ## Not currently working on Bioconductor 3.10.
#' if (
#'     requireNamespace("monocle3", quietly = TRUE) &&
#'     packageVersion("SingleCellExperiment") < "1.8"
#' ) {
#'     data(cell_data_set)
#'     class(cell_data_set)
#'     cell_data_set
#' }
"cell_data_set"
