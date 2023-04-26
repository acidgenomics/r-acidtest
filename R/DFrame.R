#' S4 data frame
#'
#' Example Bioconductor S4 `DFrame` object.
#'
#' @note Updated 2023-04-26.
#' @usage data(DFrame)
#' @return `DFrame`.
#'
#' @examples
#' if (requireNamespace("S4Vectors", quietly = TRUE)) {
#'     data(DFrame)
#'     class(DFrame)
#'     is(DFrame, "DFrame")
#'     DFrame
#' }
"DFrame"
