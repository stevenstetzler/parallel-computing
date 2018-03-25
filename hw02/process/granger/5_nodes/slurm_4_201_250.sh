#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/5_nodes/script_4_201_250.out
#SBATCH --error=granger/5_nodes/script_4_201_250.err
#SBATCH --job-name="201-250"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 201 -e 250 -a &> /dev/null
date +%s%N
