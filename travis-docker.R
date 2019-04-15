#!/bin/sh

# Note that BiocCheck requires directory name to match package name.
setwd("/acidtest")

# devtools::check(pkg = ".", document = FALSE, manual = FALSE)
rcmdcheck::rcmdcheck(path = ".", args = "--no-manual")
BiocCheck::BiocCheck(package = ".")
# lintr::lint_package(path = ".")
# covr::report()
