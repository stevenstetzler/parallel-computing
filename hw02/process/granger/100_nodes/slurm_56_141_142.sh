#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_56_141_142.out
#SBATCH --error=granger/100_nodes/script_56_141_142.err
#SBATCH --job-name="141-142"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 141 -e 142 -a &> /dev/null
date +%s%N
