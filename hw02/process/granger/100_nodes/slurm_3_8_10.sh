#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_3_8_10.out
#SBATCH --error=granger/100_nodes/script_3_8_10.err
#SBATCH --job-name="8-10"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 8 -e 10 -a &> /dev/null
date +%s%N
