#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_60_61_61.out
#SBATCH --error=granger/100_nodes_interleave/script_60_61_61.err
#SBATCH --job-name="61-61"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 61 -e 61 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 161 -e 161 -a &> /dev/null
date +%s%N
