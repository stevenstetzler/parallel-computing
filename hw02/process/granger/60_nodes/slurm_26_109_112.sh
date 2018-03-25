#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes/script_26_109_112.out
#SBATCH --error=granger/60_nodes/script_26_109_112.err
#SBATCH --job-name="109-112"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 109 -e 112 -a &> /dev/null
date +%s%N
