#' Cell data set
#'
#' Example monocle3 `cell_data_set` object.
#'
#' @note Updated 2019-10-30.
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
