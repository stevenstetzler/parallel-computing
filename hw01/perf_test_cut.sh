#!/bin/bash
# This is a template for a simple SLURM sbatch job script file
#
# First, SBATCH options - these could be passed via the command line, but this
# is more convenient
#
#SBATCH --job-name="CS 4444 HW 01" #Name of the job which appears in squeue
#
#SBATCH --mail-type=ALL #What notifications are sent by email
#SBATCH --mail-user=sgs7cr@virginia.edu
#
# Set up your user environment!!
#SBATCH --get-user-env
#
#SBATCH --error="cut_test_big.err"                    # Where to write stderr
#SBATCH --output="cut_test_big.out"                # Where to write stdout

srun gcc -c kdtree.c

export NODE=""
export SEED=1
export CUT=0.5
IN=input_${SIZE}_${SEED}.txt

export SIZE=20000
IN=input_${SIZE}_${SEED}.txt
srun echo ""
srun hostname
srun lscpu
srun echo ""
srun echo "-----------  None  ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun ./generate_input $SIZE $SEED > $IN
srun gcc -c opt.c
srun gcc opt.o kdtree.o -o opt -lm
srun ./opt $IN $CUT
srun echo ""
srun echo "-----------   O1   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O1
srun gcc opt.o kdtree.o -o optO1 -lm
srun ./optO1 $IN $CUT
srun echo ""
srun echo "-----------   O2   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O2
srun gcc opt.o kdtree.o -o optO2 -lm
srun ./optO2 $IN $CUT
srun echo ""
srun echo "-----------   O3   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O3
srun gcc opt.o kdtree.o -o optO3 -lm
srun ./optO3 $IN $CUT

export CUT=0.4
export SIZE=20000
IN=input_${SIZE}_${SEED}.txt

srun echo ""
srun hostname
srun lscpu
srun echo ""
srun echo "-----------  None  ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun ./generate_input $SIZE $SEED > $IN
srun gcc -c opt.c
srun gcc opt.o kdtree.o -o opt -lm
srun ./opt $IN $CUT
srun echo ""
srun echo "-----------   O1   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O1
srun gcc opt.o kdtree.o -o optO1 -lm
srun ./optO1 $IN $CUT
srun echo ""
srun echo "-----------   O2   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O2
srun gcc opt.o kdtree.o -o optO2 -lm
srun ./optO2 $IN $CUT
srun echo ""
srun echo "-----------   O3   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O3
srun gcc opt.o kdtree.o -o optO3 -lm
srun ./optO3 $IN $CUT

export CUT=0.3
IN=input_${SIZE}_${SEED}.txt

srun echo ""
srun hostname
srun lscpu
srun echo ""
srun echo "-----------  None  ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun ./generate_input $SIZE $SEED > $IN
srun gcc -c opt.c
srun gcc opt.o kdtree.o -o opt -lm
srun ./opt $IN $CUT
srun echo ""
srun echo "-----------   O1   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O1
srun gcc opt.o kdtree.o -o optO1 -lm
srun ./optO1 $IN $CUT
srun echo ""
srun echo "-----------   O2   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O2
srun gcc opt.o kdtree.o -o optO2 -lm
srun ./optO2 $IN $CUT
srun echo ""
srun echo "-----------   O3   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O3
srun gcc opt.o kdtree.o -o optO3 -lm
srun ./optO3 $IN $CUT

export CUT=0.2
IN=input_${SIZE}_${SEED}.txt

srun echo ""
srun hostname
srun lscpu
srun echo ""
srun echo "-----------  None  ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun ./generate_input $SIZE $SEED > $IN
srun gcc -c opt.c
srun gcc opt.o kdtree.o -o opt -lm
srun ./opt $IN $CUT
srun echo ""
srun echo "-----------   O1   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O1
srun gcc opt.o kdtree.o -o optO1 -lm
srun ./optO1 $IN $CUT
srun echo ""
srun echo "-----------   O2   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O2
srun gcc opt.o kdtree.o -o optO2 -lm
srun ./optO2 $IN $CUT
srun echo ""
srun echo "-----------   O3   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O3
srun gcc opt.o kdtree.o -o optO3 -lm
srun ./optO3 $IN $CUT


export CUT=0.1
IN=input_${SIZE}_${SEED}.txt

srun echo ""
srun hostname
srun lscpu
srun echo ""
srun echo "-----------  None  ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun ./generate_input $SIZE $SEED > $IN
srun gcc -c opt.c
srun gcc opt.o kdtree.o -o opt -lm
srun ./opt $IN $CUT
srun echo ""
srun echo "-----------   O1   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O1
srun gcc opt.o kdtree.o -o optO1 -lm
srun ./optO1 $IN $CUT
srun echo ""
srun echo "-----------   O2   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O2
srun gcc opt.o kdtree.o -o optO2 -lm
srun ./optO2 $IN $CUT
srun echo ""
srun echo "-----------   O3   ------------"
srun echo "  SIZE = $SIZE  CUT = $CUT  "
srun gcc -c opt.c -O3
srun gcc opt.o kdtree.o -o optO3 -lm
srun ./optO3 $IN $CUT
