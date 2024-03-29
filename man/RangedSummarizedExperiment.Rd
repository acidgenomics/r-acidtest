% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RangedSummarizedExperiment.R
\docType{data}
\name{RangedSummarizedExperiment}
\alias{RangedSummarizedExperiment}
\title{Ranged summarized experiment}
\format{
An object of class \code{RangedSummarizedExperiment} with 500 rows and 12 columns.
}
\usage{
data(RangedSummarizedExperiment)
}
\value{
\code{RangedSummarizedExperiment}.
}
\description{
Example \code{RangedSummarizedExperiment} containing gene-level RNA-seq data.
}
\details{
Generated with \code{DESeq2::makeExampleDESeqDataSet()}. Contains actual gene
identifiers and Ensembl annotations.
}
\note{
Updated 2021-02-05.
}
\examples{
if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
    data(RangedSummarizedExperiment)
    class(RangedSummarizedExperiment)
    print(RangedSummarizedExperiment)
}
}
\keyword{datasets}
