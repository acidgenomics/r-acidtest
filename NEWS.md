## acidtest 0.2.9 (2020-01-18)

- Renamed `DataFrame` example to `DFrame`, based on Bioconductor 3.10 change.

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
