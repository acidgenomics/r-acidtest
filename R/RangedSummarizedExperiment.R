#' Ranged summarized experiment
#'
#' Example `RangedSummarizedExperiment` containing gene-level RNA-seq data.
#'
#' Generated with `DESeq2::makeExampleDESeqDataSet()`. Contains actual gene
#' identifiers and Ensembl annotations.
#'
#' @examples
#' if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
#'     data(RangedSummarizedExperiment)
#'     class(RangedSummarizedExperiment)
#'     RangedSummarizedExperiment
#' }
"RangedSummarizedExperiment"
