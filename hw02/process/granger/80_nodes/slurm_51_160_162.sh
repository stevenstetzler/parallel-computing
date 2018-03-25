#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes/script_51_160_162.out
#SBATCH --error=granger/80_nodes/script_51_160_162.err
#SBATCH --job-name="160-162"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 160 -e 162 -a &> /dev/null
date +%s%N
