## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(SummarizedExperiment)
    library(basejump)
    library(DESeq2)
})
## nolint end
limit <- structure(1e6L, class = "object_size")
## Generate example DESeqDataSet using DESeq2.
## Note that we're using simulated counts here.
dds <- makeExampleDESeqDataSet(n = 500L, m = 12L, betaSD = 1L)
stopifnot(
    object.size(dds) < limit,
    validObject(dds)
)
## Coerce to RangedSummarizedExperiment.
## Need to change rows to actual gene identifiers here, and slot colData.
rse <- as(dds, "RangedSummarizedExperiment")
stopifnot(object.size(rse) < limit)
## Pad the dimnames so they sort correctly.
rse <- autopadZeros(rse, rownames = TRUE)
## Row data. Include real `geneId`, `geneName` columns to test mapping.
rowRanges <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    level = "genes",
    release = 100L,
    ignoreVersion = FALSE
)
rowRanges <- as(rowRanges, "GRanges")
rowRanges <- rowRanges[sort(names(rowRanges))]
## Subset to match the number of rows in the example.
rowRanges <- rowRanges[seq_len(nrow(rse)), ]
## Relevel the factor columns, to save disk space.
rowRanges <- droplevels2(rowRanges)
## Note that we're keeping the original rownames from dds_small, and they won't
## match the `geneId` column in rowRanges. This is intentional, for unit tests.
names(rowRanges) <- rownames(rse)
rowRanges(rse) <- rowRanges
## Metadata.
## Stash the date.
metadata(rse)[["date"]] <- Sys.Date()
## Define the interesting groups.
interestingGroups(rse) <- "condition"
stopifnot(
    object.size(rse) < limit,
    validObject(rse)
)
RangedSummarizedExperiment <- rse # nolint
use_data(RangedSummarizedExperiment, compress = "xz", overwrite = TRUE)
