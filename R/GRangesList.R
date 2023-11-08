#' S4 genomic ranges list
#'
#' Example Bioconductor S4 `GRangesList` object.
#'
#' @note Updated 2023-11-08.
#' @usage data(GRangesList)
#' @return `GRangesList`.
#'
#' @examples
#' if (requireNamespace("GenomicRanges", quietly = TRUE)) {
#'     data(GRangesList)
#'     class(GRangesList)
#'     is(GRangesList, "GRangesList")
#'     print(GRangesList)
#' }
"GRangesList"
