#!/bin/bash
cd ../parser
make -f Makefile.SSE3.gcc
cd ../examl
make -f Makefile.SSE3.gcc
