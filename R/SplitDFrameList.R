## NOTE pkgdown currently generates warning related to ncol (deprecated) usage
## instead of ncols.

#' S4 split data frame list
#'
#' Example Bioconductor S4 `SplitDFrameList` object.
#'
#' @note Updated 2023-11-08.
#' @usage data(SplitDFrameList)
#' @return `SplitDFrameList`.
#'
#' @examples
#' if (requireNamespace("IRanges", quietly = TRUE)) {
#'     data(SplitDFrameList)
#'     class(SplitDFrameList)
#'     is(SplitDFrameList, "SplitDFrameList")
#'     print(SplitDFrameList)
#' }
"SplitDFrameList"
