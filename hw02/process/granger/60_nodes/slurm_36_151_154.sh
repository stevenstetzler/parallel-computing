#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_36_151_154.out
#SBATCH --error=granger/60_nodes/script_36_151_154.err
#SBATCH --job-name="151-154"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 151 -e 154 -a &> /dev/null
date +%s%N
