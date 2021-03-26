cd parser
./parse-examl -m DNA -s ../testData/49 -q ../testData/49.model -n 49

cd ..
mpirun -np $1 ./examl/examl -t testData/49.tree -m GAMMA -n T$1 -s parser/49.binary
