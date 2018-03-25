#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes/script_18_151_158.out
#SBATCH --error=granger/30_nodes/script_18_151_158.err
#SBATCH --job-name="151-158"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 151 -e 158 -a &> /dev/null
date +%s%N
