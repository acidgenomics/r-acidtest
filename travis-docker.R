#!/bin/sh

# Note that BiocCheck requires directory name to match package name.
setwd("/acidtest")

# devtools::check(pkg = ".", document = FALSE)
rcmdcheck::rcmdcheck(path = ".")
BiocCheck::BiocCheck(package = ".")
lintr::lint_package(path = ".")
covr::report()
