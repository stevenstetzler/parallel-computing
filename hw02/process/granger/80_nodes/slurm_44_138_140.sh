#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_44_138_140.out
#SBATCH --error=granger/80_nodes/script_44_138_140.err
#SBATCH --job-name="138-140"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 138 -e 140 -a &> /dev/null
date +%s%N
