#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes/script_21_132_137.out
#SBATCH --error=granger/40_nodes/script_21_132_137.err
#SBATCH --job-name="132-137"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 132 -e 137 -a &> /dev/null
date +%s%N
