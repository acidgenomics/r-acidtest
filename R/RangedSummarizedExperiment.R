#' Ranged summarized experiment
#'
#' Example `RangedSummarizedExperiment` containing gene-level RNA-seq data.
#'
#' Generated with `DESeq2::makeExampleDESeqDataSet()`. Contains actual gene
#' identifiers and Ensembl annotations.
#'
#' @note Updated 2021-02-05.
#' @usage data(RangedSummarizedExperiment)
#' @return `RangedSummarizedExperiment`.
#'
#' @examples
#' if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
#'     data(RangedSummarizedExperiment)
#'     class(RangedSummarizedExperiment)
#'     print(RangedSummarizedExperiment)
#' }
"RangedSummarizedExperiment"
