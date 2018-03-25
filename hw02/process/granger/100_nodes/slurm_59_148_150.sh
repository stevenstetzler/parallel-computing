#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_59_148_150.out
#SBATCH --error=granger/100_nodes/script_59_148_150.err
#SBATCH --job-name="148-150"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 148 -e 150 -a &> /dev/null
date +%s%N
