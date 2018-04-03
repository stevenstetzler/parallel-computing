#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/20_nodes/script_13_163_175.out
#SBATCH --error=slurm/20_nodes/script_13_163_175.err
#SBATCH --job-name="163-175"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 163 -e 175 -a &> /dev/null
date +%s%N