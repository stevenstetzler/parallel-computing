#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_19_48_50.out
#SBATCH --error=granger/100_nodes/script_19_48_50.err
#SBATCH --job-name="48-50"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 48 -e 50 -a &> /dev/null
date +%s%N