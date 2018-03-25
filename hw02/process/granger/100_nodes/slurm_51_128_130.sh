#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_51_128_130.out
#SBATCH --error=granger/100_nodes/script_51_128_130.err
#SBATCH --job-name="128-130"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 128 -e 130 -a &> /dev/null
date +%s%N
