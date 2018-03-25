#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/10_nodes/script_9_226_250.out
#SBATCH --error=slurm/10_nodes/script_9_226_250.err
#SBATCH --job-name="226-250"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 226 -e 250 -a &> /dev/null
date +%s%N
