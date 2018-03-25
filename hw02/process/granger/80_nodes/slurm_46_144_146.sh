#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_46_144_146.out
#SBATCH --error=granger/80_nodes/script_46_144_146.err
#SBATCH --job-name="144-146"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 144 -e 146 -a &> /dev/null
date +%s%N
