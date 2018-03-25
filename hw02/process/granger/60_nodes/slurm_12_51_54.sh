#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_12_51_54.out
#SBATCH --error=granger/60_nodes/script_12_51_54.err
#SBATCH --job-name="51-54"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 51 -e 54 -a &> /dev/null
date +%s%N
