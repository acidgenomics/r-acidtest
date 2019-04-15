#!/bin/sh

cd /travis
R CMD build .
R CMD check acidtest_*.tar.gz
