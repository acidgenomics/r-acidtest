#' S4 data frame list
#'
#' Example Bioconductor S4 `DFrameList` object.
#'
#' @note Updated 2023-11-08.
#' @usage data(DFrameList)
#' @return `DFrameList`.
#'
#' @examples
#' if (requireNamespace("IRanges", quietly = TRUE)) {
#'     data(DFrameList)
#'     class(DFrameList)
#'     is(DFrameList, "DFrameList")
#'     DFrameList
#' }
"DFrameList"
