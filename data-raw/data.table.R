library(usethis)     # 1.5.1
library(data.table)  # 1.12.8
data(matrix)
data.table <- as.data.table(matrix, keep.rownames = TRUE)
use_data(data.table, compress = "xz", overwrite = TRUE)
