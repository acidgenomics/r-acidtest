library(usethis)
library(pryr)                  # 0.1.4
library(SummarizedExperiment)  # 1.16.1
library(basejump)              # 0.12.4
library(DESeq2)                # 1.26.0

## Restrict to 1.5 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(1.5e6, class = "object_size")

organism <- "Homo sapiens"
release <- 99L

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

## Row data. Include real `geneID`, `geneName` columns to test mapping.
rowRanges <- makeGRangesFromEnsembl(organism = organism, release = release)
## Subset to match the number of rows in the example.
rowRanges <- rowRanges[seq_len(nrow(rse)), ]
## Relevel the factor columns, to save disk space.
rowRanges <- droplevels(rowRanges)
## Note that we're keeping the original rownames from dds_small, and they won't
## match the `geneID` column in rowRanges. This is intentional, for unit tests.
names(rowRanges) <- rownames(rse)
rowRanges(rse) <- rowRanges

## Metadata.
## Stash the date.
metadata(rse)[["date"]] <- Sys.Date()
## Define the interesting groups.
interestingGroups(rse) <- "condition"

## Size check.
lapply(coerceS4ToList(rse), object_size)
object_size(rse)
stopifnot(object_size(rse) < limit)
validObject(rse)

RangedSummarizedExperiment <- rse
use_data(RangedSummarizedExperiment, compress = "xz", overwrite = TRUE)
