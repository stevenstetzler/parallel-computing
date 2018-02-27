#!/bin/bash
#
#SBATCH --job-name="CS 4444 HW 01" Name of the job which appears in squeue
#
#SBATCH --mail-type=ALL What notifications are sent by email
#SBATCH --mail-user=sgs7cr@virginia.edu
#
# Set up your user environment!!
#SBATCH --get-user-env
#
#SBATCH --error="perf.err"                     Where to write stderr
#SBATCH --output="perf.out"                 Where to write stdout

export NODE="nibbler4"
export SEED=1
export CUT=0.5
export SIZE=20000
IN=input_${SIZE}_${SEED}.txt

hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=10000
IN=input_${SIZE}_${SEED}.txt
echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=5000
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=2500
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=1000
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=500
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export CUT=0.4
export SIZE=10000
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export CUT=0.3
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export CUT=0.2
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export CUT=0.1
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=20000
export CUT=0.1
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=5000
export CUT=0.1
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=2500
export CUT=0.1
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=1000
export CUT=0.1
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

export SIZE=500
export CUT=0.1
IN=input_${SIZE}_${SEED}.txt

echo ""
hostname
lscpu
echo ""
echo "-----------  None  ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
./generate_input $SIZE $SEED > $IN
gcc -c opt.c
gcc -c kdtree.c
gcc opt.o kdtree.o -o opt -lm
./opt $IN $CUT
echo ""
echo "-----------   O1   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O1
gcc -c kdtree.c -O1
gcc opt.o kdtree.o -o optO1 -lm
./optO1 $IN $CUT
echo ""
echo "-----------   O2   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O2
gcc -c kdtree.c -O2
gcc opt.o kdtree.o -o optO2 -lm
./optO2 $IN $CUT
echo ""
echo "-----------   O3   ------------"
echo "  SIZE = $SIZE  CUT = $CUT  "
gcc -c opt.c -O3
gcc -c kdtree.c -O3
gcc opt.o kdtree.o -o optO3 -lm
./optO3 $IN $CUT

