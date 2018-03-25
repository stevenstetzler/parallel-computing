#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes/script_15_94_100.out
#SBATCH --error=granger/40_nodes/script_15_94_100.err
#SBATCH --job-name="94-100"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 94 -e 100 -a &> /dev/null
date +%s%N
