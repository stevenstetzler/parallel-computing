#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_41_129_131.out
#SBATCH --error=granger/80_nodes/script_41_129_131.err
#SBATCH --job-name="129-131"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 129 -e 131 -a &> /dev/null
date +%s%N
