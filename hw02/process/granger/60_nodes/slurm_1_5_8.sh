#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_1_5_8.out
#SBATCH --error=granger/60_nodes/script_1_5_8.err
#SBATCH --job-name="5-8"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 5 -e 8 -a &> /dev/null
date +%s%N
