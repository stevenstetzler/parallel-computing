#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_8_26_28.out
#SBATCH --error=granger/80_nodes/script_8_26_28.err
#SBATCH --job-name="26-28"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 26 -e 28 -a &> /dev/null
date +%s%N
