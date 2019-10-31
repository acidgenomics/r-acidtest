## Note that this now returns "DFrame" instead of "DataFrame", as of
## Bioconductor 3.10 release.
library(usethis)    # 1.5.1
library(S4Vectors)  # 0.24.0
data(matrix)
DataFrame <- DataFrame(matrix)
use_data(DataFrame, compress = "xz", overwrite = TRUE)
