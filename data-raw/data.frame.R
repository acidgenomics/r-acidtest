library(usethis)
data(matrix)
data.frame <- as.data.frame(matrix)
use_data(data.frame, compress = "xz", overwrite = TRUE)
