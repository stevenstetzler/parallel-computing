#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/20_nodes/script_9_113_125.out
#SBATCH --error=slurm/20_nodes/script_9_113_125.err
#SBATCH --job-name="113-125"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 113 -e 125 -a &> /dev/null
date +%s%N
