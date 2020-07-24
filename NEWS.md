## acidtest 0.3.2 (2020-07-24)

- Resaved Seurat object.

## acidtest 0.3.1 (2020-07-23)

### Minor changes

- Maintenance release, increasing R dependency to 4.0.

## acidtest 0.3.0 (2020-03-16)

- Resaved all example datasets.
- Now using Ensembl 99 as reference instead of 92, where applicable. This helps
  avoid errors in other packages, namely pfgsea due to current Ensembl server
  migration (until March 24th) that renders all archives inaccessible, causing
  biomaRt code to error out.

## acidtest 0.2.14 (2020-01-28)

- Additional documentation fixes to avoid CRAN warnings related to roxygen2
  not outputting correct usage example for data when `lazyData: FALSE`.

## acidtest 0.2.13 (2020-01-28)

- Documentation fixes to pass CRAN release checks.

## acidtest 0.2.12 (2020-01-27)

- Removed monocle3 `cell_data_set` example object. Will add back when monocle3
  is available on Bioconductor.

## acidtest 0.2.11 (2020-01-20)

- Reverted saved version of `SingleCellExperiment` back to v0.2.8 version, as
  too many unit tests will fail in basejump otherwise, due to splatter creating
  a new random count matrix.

## acidtest 0.2.10 (2020-01-19)

- Migrated `band_instruments` and `band_members` (dplyr join examples) from
  now archived transformer package here to acidtest.

## acidtest 0.2.9 (2020-01-18)

- Renamed `DataFrame` example to `DFrame`, based on Bioconductor 3.10 change.
- Resaved all example objects.

## acidtest 0.2.8 (2019-11-11)

- Resaved `cell_data_set` object.

## acidtest 0.2.7 (2019-10-30)

- Resaved objects following Bioconductor 3.10 release.

## acidtest 0.2.6 (2019-10-21)

- No longer checking against `NA` for syntactic functions.

## acidtest 0.2.5 (2019-08-27)

- Updated R dependency to 3.6.

## acidtest 0.2.4 (2019-08-13)

- Resaved `Seurat` and `SingleCellExperiment_Seurat` objects.
- Added additional comments regarding how to configure reticulate and UMAP to
  generate an example `Seurat` object with dimension reduction applied.

## acidtest 0.2.3 (2019-08-10)

- `SingleCellExperiment`: Updated example to zero pad both row and column names.
  Previously, only the column names were padded.
- Improved reticulate documentation on how to process Seurat.

## acidtest 0.2.2 (2019-08-02)

- `cell_data_set`: New example monocle3 `cell_data_set` S4 object.

## acidtest 0.2.1 (2019-07-30)

- `RangedSummarizedExperiment`: Resaved with additional metadata columns in
  `rowData` that are useful for unit testing in DESeqAnalysis package.

## acidtest 0.2.0 (2019-07-21)

- Disabled lazy data loading.
- Spelled out object class names to make example data more straightforward.
- Saved additional `SingleCellExperiment` and `SummarizedExperiment` examples.
- There's no currently no supported way to redirect old data names, so these
  changes are breaking.

## acidtest 0.1.5 (2019-07-16)

- Added `seurat` example, migrated from pointillism package.
- Resaved `sce` based on new `seurat` object.
- Archived source code for previous `sce` as `sce_splatter.R`.

## acidtest 0.1.4 (2019-07-12)

- Added `dt` example `data.table` object.
- Improved documentation consistency.

## acidtest 0.1.3 (2019-07-11)

- Added `ir` example `IRanges` object.

## acidtest 0.1.2 (2019-05-05)

- Now pinned to R >= 3.5.

## acidtest 0.1.1 (2019-04-01)

- Added `gr`, `lfc`, `mn`, and `txse` test data.

## acidtest 0.1.0 (2019-03-28)

- Initial release.
