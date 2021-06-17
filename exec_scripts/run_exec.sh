#!/bin/bash
HOSTFILE=$PWD/hostfile
DATASET=$PWD/$1
NAME=$(date +"%m-%d-%y-%T")
mkdir $DATASET
cd ..
examl_A="./examl/examl -t testData/49.tree -m GAMMA -n T1 -s parser/49.binary"
examl_B="./examl/examl -t testData/140.tree -m GAMMA -n T2 -s parser/140.binary"
examl_C="./examl/examl -t testData/354.tree -m GAMMA -n T3 -s parser/354.binary"
cd parser
#./parse-examl -m DNA -s ../testData/49 -q ../testData/49.model -n 49
#./parse-examl -m DNA -s ../testData/140 -q ../testData/140.model -n 140
#./parse-examl -m DNA -s ../testData/354 -q ../testData/354.model -n 354
cd ..
mpirun -n $2 --hostfile $HOSTFILE $examl_A > $DATASET/$NAME-examl-A.out 2> $DATASET/$NAME-examl-A.err
mpirun -n $2 --hostfile $HOSTFILE $examl_B > $DATASET/$NAME-examl-B.out 2> $DATASET/$NAME-examl-B.err
#mpirun -n $2 --hostfile $HOSTFILE $examl_C > $DATASET/$NAME-examl-C.out 2> $DATASET/$NAME-examl-C.err
rm -f *T1*
rm -f *T2*
rm -f *T3*
