#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_84_85_85.out
#SBATCH --error=granger/100_nodes_interleave/script_84_85_85.err
#SBATCH --job-name="85-85"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 85 -e 85 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 185 -e 185 -a &> /dev/null
date +%s%N
