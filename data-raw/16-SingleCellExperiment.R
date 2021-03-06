## Splatter params are derived from:
## https://github.com/mikelove/zinbwave-deseq2/blob/master/
##     zinbwave-deseq2.knit.md
suppressPackageStartupMessages({
    library(usethis)
    library(pryr)
    library(SingleCellExperiment)
    library(splatter)
    library(basejump)
})
limit <- structure(1e6, class = "object_size")
## Use splatter to generate an example dataset with simulated counts.
## Note: These DE params are natural log scale.
params <- newSplatParams() %>%
    setParam(name = "batchCells", value = 100L) %>%
    setParam(name = "nGenes", value = 500L) %>%
    setParam(name = "de.facLoc", value = 1L) %>%
    setParam(name = "de.facScale", value = 0.25) %>%
    ## Add more dropout (to test zinbwave weights and DE).
    setParam(name = "dropout.type", value = "experiment") %>%
    setParam(name = "dropout.mid", value = 3L)
sce <- splatSimulate(
    params = params,
    group.prob = c(0.5, 0.5),
    method = "groups"
)
## Sanitize the dimnames into camel case.
sce <- camelCase(sce, rownames = TRUE, colnames = TRUE, strict = TRUE)
colData(sce) <- camelCase(colData(sce))
## Prepare column data.
colData(sce) <- DataFrame(
    "sampleId" = factor(gsub("group", "sample", camelCase(sce$group))),
    row.names = colnames(sce)
)
## Pad the zeros in rows and columns.
sce <- autopadZeros(sce, rownames = TRUE, colnames = TRUE)
## Just slot the raw counts, as a sparse matrix.
counts <- counts(sce)
counts <- as(counts, "sparseMatrix")
assays(sce) <- list(counts = counts)
## Prepare row data.
rowRanges <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    release = 100L,
    level = "genes",
    ignoreVersion = FALSE
)
rowRanges <- as(rowRanges, "GRanges")
rowRanges <- rowRanges[sort(names(rowRanges))]
rowRanges <- rowRanges[seq_len(nrow(sce)), ]
rowRanges <- droplevels(rowRanges)
## Note that we're keeping the original rownames from dds_small, and they won't
## match the `geneId` column in rowRanges. This is intentional, for unit tests.
names(rowRanges) <- rownames(sce)
rowRanges(sce) <- rowRanges
## Stash minimal metadata.
metadata(sce) <- list(date = Sys.Date())
## Report the size of each slot in bytes.
lapply(coerceToList(sce), object_size)
object_size(sce)
stopifnot(object_size(sce) < limit)
validObject(sce)
SingleCellExperiment <- sce
use_data(SingleCellExperiment, compress = "xz", overwrite = TRUE)
