#' Data frame
#'
#' Example Bioconductor S4 `DataFrame` object.
#'
#' @examples
#' if (requireNamespace("S4Vectors", quietly = TRUE)) {
#'     data(df)
#'     class(df)
#'     df
#' }
"df"



#' Data table
#'
#' Example `data.table` object.
#'
#' @examples
#' if (requireNamespace("data.table", quietly = TRUE)) {
#'     data(dt)
#'     class(dt)
#'     dt
#' }
"dt"



#' Genomic ranges
#'
#' Example `GRanges` object.
#'
#' @examples
#' if (requireNamespace("GenomicRanges", quietly = TRUE)) {
#'     data(gr)
#'     class(gr)
#'     gr
#' }
"gr"



#' Integer ranges
#'
#' Examples `IRanges` object.
#'
#' @examples
#' if (requireNamespace("IRanges", quietly = TRUE)) {
#'     data(ir)
#'     class(ir)
#'     ir
#' }
"ir"



#' Log fold change
#'
#' Example `matrix` containing log base 2 fold change values.
#'
#' @examples
#' data(lfc)
#' class(lfc)
#' lfc
"lfc"



#' Matrix
#'
#' Example `matrix` object.
#'
#' @examples
#' data(mat)
#' class(mat)
#' mat
"mat"



#' Make names
#'
#' Example `list` data used to test syntactic naming functions.
#'
#' @examples
#' data(mn)
#' class(mn)
#' names(mn)
"mn"



#' Summarized experiment
#'
#' Example `SummarizedExperiment` containing gene-level RNA-seq data.
#'
#' Generated with `DESeq2::makeExampleDESeqDataSet()`. Contains actual gene
#' identifiers and Ensembl annotations.
#'
#' @examples
#' if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
#'     data(rse)
#'     class(rse)
#'     rse
#' }
"rse"



#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @seealso `scater::sc_example_counts`.
#'
#' @examples
#' if (requireNamespace("SingleCellExperiment", quietly = TRUE)) {
#'     data(sce)
#'     class(sce)
#'     sce
#' }
"sce"



#' Seurat
#'
#' Example `Seurat` (v3) object.
#'
#' @examples
#' if (requireNamespace("Seurat", quietly = TRUE)) {
#'     data(seurat)
#'     class(seurat)
#'     seurat
#' }
"seurat"



#' Sparse matrix
#'
#' Example `sparseMatrix` object.
#'
#' @examples
#' if (requireNamespace("Matrix", quietly = TRUE)) {
#'     data(sparse)
#'     class(sparse)
#'     sparse
#' }
"sparse"



#' Tibble
#'
#' Example `tbl_df` object.
#'
#' @examples
#' if (requireNamespace("tibble", quietly = TRUE)) {
#'     data(tbl)
#'     class(tbl)
#'     tbl
#' }
"tbl"



#' Transcript-level summarized experiment
#'
#' Example `SummarizedExperiment` containing transcript-level RNA-seq data.
#'
#' @examples
#' if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
#'     data(txse)
#'     class(txse)
#'     txse
#' }
"txse"
