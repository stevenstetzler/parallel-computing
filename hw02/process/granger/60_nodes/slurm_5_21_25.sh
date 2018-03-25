#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_5_21_25.out
#SBATCH --error=granger/60_nodes/script_5_21_25.err
#SBATCH --job-name="21-25"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 21 -e 25 -a &> /dev/null
date +%s%N
