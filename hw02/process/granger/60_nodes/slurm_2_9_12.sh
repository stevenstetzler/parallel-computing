#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_2_9_12.out
#SBATCH --error=granger/60_nodes/script_2_9_12.err
#SBATCH --job-name="9-12"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 9 -e 12 -a &> /dev/null
date +%s%N
