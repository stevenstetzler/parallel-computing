#!/bin/bash
#/#/#//SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4],slurm[1-5],ai[01-06]
#SBATCH --exclude=trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4],slurm[1-5],ai[01-06]
#SBATCH --output=test_2_64_2.out
#SBATCH --error=test_2_64_2.err
#SBATCH --job-name="test_2_64"
#SBATCH --cpus-per-task=64
#SBATCH --nodes=1
#SBATCH --exclusive
hostname
echo $SLURM_CPUS_PER_TASK
gcc -pthread -o parallel_2 -O3 parallel_plate.c -lm

echo ""
echo "64"
echo ""
date +%s%N
time ./parallel_2 10000 10000 10000 64 2
date +%s%N
echo ""
echo "32"
echo ""
date +%s%N
time ./parallel_2 10000 10000 10000 32 2
date +%s%N
echo ""
echo "16"
echo ""
date +%s%N
time ./parallel_2 10000 10000 10000 16 2
date +%s%N
echo ""
echo "8"
echo ""
date +%s%N
time ./parallel_2 10000 10000 10000 8 2
date +%s%N
echo ""
echo "4"
echo ""
date +%s%N
time ./parallel_2 10000 10000 10000 4 2
date +%s%N
echo ""
echo "2"
echo ""
date +%s%N
time ./parallel_2 10000 10000 10000 2 2
date +%s%N
