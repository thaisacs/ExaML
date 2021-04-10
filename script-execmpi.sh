DATASET=exp-results
rm -rf $DATASET
mkdir $DATASET

cd parser
./parse-examl -m DNA -s ../testData/49 -q ../testData/49.model -n 49
cd ..

APP=

sudo perf stat -o $DATASET/perf-examl.out ./examl/examl -t testData/49.tree -m GAMMA -n T1 -s parser/49.binary
/usr/bin/time -o $DATASET/time-examl.out -v ./examl/examl -t testData/49.tree -m GAMMA -n T2 -s parser/49.binary
ltrace -o $DATASET/mpi-examl.out ./examl/examl -t testData/49.tree -m GAMMA -n T3 -s parser/49.binary

cat $DATASET/mpi-examl.out | grep "MPI" > $DATASET/mpi2-examl.out
rm $DATASET/mpi-examl.out

#mpirun -np $1 ./examl/examl -t testData/49.tree -m GAMMA -n T$1 -s parser/49.binary
