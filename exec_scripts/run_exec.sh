#!/bin/bash
HOSTFILE=$PWD/hostfile
DATASET=$PWD/$1
NAME=$(date +"%m-%d-%y-%T")
mkdir $DATASET
cd ..
examl_a_app="./examl/examl -t testData/49.tree -m GAMMA -n T1 -s parser/49.binary"
examl_b_app="./examl/examl -t testData/140.tree -m GAMMA -n T2 -s parser/140.binary"
# examl
#mpirun -n $2 --hostfile $HOSTFILE $examl_a_app > $DATASET/$NAME-examl-A.out 2> $DATASET/$NAME-examl-A.err
mpirun -n $2 --hostfile $HOSTFILE $examl_b_app > $DATASET/$NAME-examl-B.out 2> $DATASET/$NAME-examl-B.err
rm -f *T1*
rm -f *T2*
