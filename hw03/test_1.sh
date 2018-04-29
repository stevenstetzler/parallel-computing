#!/bin/bash
#/#/#//SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4],slurm[1-5],ai[01-06]
#SBATCH --exclude=trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4],slurm[1-5],ai[01-06]
#SBATCH --output=test_1.out
#SBATCH --error=test_1.err
#SBATCH --job-name="test_1"
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --exclusive
hostname
echo $SLURM_CPUS_PER_TASK
gcc -pthread -o parallel_1 parallel_plate.c -lm

echo ""
echo "64"
echo ""
date +%s%N
time ./parallel_1 10000 10000 10000 64 1
date +%s%N
echo ""
echo "32"
echo ""
date +%s%N
time ./parallel_1 10000 10000 10000 32 1
date +%s%N
echo ""
echo "16"
echo ""
date +%s%N
time ./parallel_1 10000 10000 10000 16 1
date +%s%N
echo ""
echo "8"
echo ""
date +%s%N
time ./parallel_1 10000 10000 10000 8 1
date +%s%N
echo ""
echo "4"
echo ""
date +%s%N
time ./parallel_1 10000 10000 10000 4 1
date +%s%N
echo ""
echo "2"
echo ""
date +%s%N
time ./parallel_1 10000 10000 10000 2 1
date +%s%N