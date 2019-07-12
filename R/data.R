#' Data frame
#'
#' Example Bioconductor S4 `DataFrame` object.
#'
#' @examples
#' suppressPackageStartupMessages(library(DataFrame))
#' data(df)
#' class(df)
#' df
"df"



#' Data table
#'
#' Example `data.table` object.
#'
#' @examples
#' data(dt)
#' class(dt)
#' dt
"dt"



#' Genomic ranges
#'
#' Example `GRanges` object.
#'
#' @examples
#' suppressPackageStartupMessages(library(GenomicRanges))
#' data(gr)
#' class(gr)
#' gr
"gr"



#' Integer ranges
#'
#' Examples `IRanges` object.
#'
#' @examples
#' data(ir)
#' class(ir)
#' ir
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
#' suppressPackageStartupMessages(library(SummarizedExperiment))
#' data(rse)
#' class(rse)
#' rse
"rse"



#' Single cell experiment
#'
#' Example `SingleCellExperiment` containing gene-level RNA-seq data.
#'
#' @seealso `scater::sc_example_counts`.
#'
#' @examples
#' suppressPackageStartupMessages(library(SingleCellExperiment))
#' data(sce)
#' class(sce)
#' sce
"sce"



#' Sparse matrix
#'
#' Example `sparseMatrix` object.
#'
#' @examples
#' data(sparse)
#' class(sparse)
#' sparse
"sparse"



#' Tibble
#'
#' Example `tbl_df` object.
#'
#' @examples
#' data(tbl)
#' class(tbl)
#' tbl
"tbl"



#' Transcript-level summarized experiment
#'
#' Example `SummarizedExperiment` containing transcript-level RNA-seq data.
#'
#' @examples
#' suppressPackageStartupMessages(library(SummarizedExperiment))
#' data(txse)
#' class(txse)
#' txse
"txse"
