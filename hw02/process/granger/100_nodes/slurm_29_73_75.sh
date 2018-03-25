#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_29_73_75.out
#SBATCH --error=granger/100_nodes/script_29_73_75.err
#SBATCH --job-name="73-75"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 73 -e 75 -a &> /dev/null
date +%s%N
