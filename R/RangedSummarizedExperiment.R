#' Ranged summarized experiment
#'
#' Example `RangedSummarizedExperiment` containing gene-level RNA-seq data.
#'
#' Generated with `DESeq2::makeExampleDESeqDataSet()`. Contains actual gene
#' identifiers and Ensembl annotations.
#'
#' @note Updated 2019-07-30.
#'
#' @examples
#' if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
#'     data(RangedSummarizedExperiment)
#'     class(RangedSummarizedExperiment)
#'     RangedSummarizedExperiment
#' }
"RangedSummarizedExperiment"
