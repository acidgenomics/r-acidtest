suppressPackageStartupMessages({
    library(usethis)
    library(pryr)
    library(SummarizedExperiment)
    library(DESeq2)
    library(basejump)
})
limit <- structure(1e6, class = "object_size")
## Generate example DESeqDataSet using DESeq2.
## Note that we're using simulated counts here.
dds <- makeExampleDESeqDataSet(n = 500L, m = 12L, betaSD = 1L)
object_size(dds)
stopifnot(object_size(dds) < limit)
validObject(dds)
## Coerce to RangedSummarizedExperiment.
## Need to change rows to actual gene identifiers here, and slot colData.
rse <- as(dds, "RangedSummarizedExperiment")
object_size(rse)
stopifnot(object_size(rse) < limit)
## Pad the dimnames so they sort correctly.
rse <- autopadZeros(rse, rownames = TRUE)
## Row data. Include real `geneId`, `geneName` columns to test mapping.
rowRanges <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    level = "genes",
    release = 100L,
    ignoreVersion = FALSE
)
rowRanges <- rowRanges[sort(names(rowRanges))]
## Subset to match the number of rows in the example.
rowRanges <- rowRanges[seq_len(nrow(rse)), ]
## Relevel the factor columns, to save disk space.
rowRanges <- droplevels(rowRanges)
## Note that we're keeping the original rownames from dds_small, and they won't
## match the `geneId` column in rowRanges. This is intentional, for unit tests.
names(rowRanges) <- rownames(rse)
rowRanges(rse) <- rowRanges
## Metadata.
## Stash the date.
metadata(rse)[["date"]] <- Sys.Date()
## Define the interesting groups.
interestingGroups(rse) <- "condition"
## Size check.
lapply(coerceToList(rse), object_size)
object_size(rse)
stopifnot(object_size(rse) < limit)
validObject(rse)
RangedSummarizedExperiment <- rse
use_data(RangedSummarizedExperiment, compress = "xz", overwrite = TRUE)
