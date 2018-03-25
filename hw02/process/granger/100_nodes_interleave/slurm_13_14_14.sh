#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_13_14_14.out
#SBATCH --error=granger/100_nodes_interleave/script_13_14_14.err
#SBATCH --job-name="14-14"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 14 -e 14 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 114 -e 114 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 214 -e 214 -a &> /dev/null
date +%s%N
