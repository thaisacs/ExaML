#!/bin/bash
cd ../parser
make -f Makefile.SSE3.gcc
./parse-examl -m DNA -s ../testData/49 -q ../testData/49.model -n 49
./parse-examl -m DNA -s ../testData/140 -q ../testData/140.model -n 140
cd ../examl
make -f Makefile.SSE3.gcc
