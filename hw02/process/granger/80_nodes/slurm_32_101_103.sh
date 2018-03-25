#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_32_101_103.out
#SBATCH --error=granger/80_nodes/script_32_101_103.err
#SBATCH --job-name="101-103"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 101 -e 103 -a &> /dev/null
date +%s%N
