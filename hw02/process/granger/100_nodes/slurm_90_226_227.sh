#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_90_226_227.out
#SBATCH --error=granger/100_nodes/script_90_226_227.err
#SBATCH --job-name="226-227"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 226 -e 227 -a &> /dev/null
date +%s%N
