#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_74_186_187.out
#SBATCH --error=granger/100_nodes/script_74_186_187.err
#SBATCH --job-name="186-187"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 186 -e 187 -a &> /dev/null
date +%s%N
