#' S4 data frame
#'
#' Example Bioconductor S4 `DataFrame` object.
#'
#' @note Updated 2021-10-14.
#' @usage data(DataFrame)
#' @return `DFrame` / `DataFrame`.
#'
#' @examples
#' if (requireNamespace("S4Vectors", quietly = TRUE)) {
#'     data(DataFrame)
#'     class(DataFrame)
#'     is(DataFrame, "DataFrame")
#'     DataFrame
#' }
"DataFrame"
