#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/5_nodes/script_0_1_50.out
#SBATCH --error=granger/5_nodes/script_0_1_50.err
#SBATCH --job-name="1-50"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 1 -e 50 -a &> /dev/null
date +%s%N
