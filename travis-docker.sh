#!/bin/sh

R CMD build .
R CMD check *tar.gz
