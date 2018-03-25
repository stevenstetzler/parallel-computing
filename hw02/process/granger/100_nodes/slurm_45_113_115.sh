#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_45_113_115.out
#SBATCH --error=granger/100_nodes/script_45_113_115.err
#SBATCH --job-name="113-115"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 113 -e 115 -a &> /dev/null
date +%s%N
