tbl_df <- head(tibble::as_tibble(datasets::iris))
save(tbl_df, file = file.path("inst", "extdata", "tbl_df.rda"))
