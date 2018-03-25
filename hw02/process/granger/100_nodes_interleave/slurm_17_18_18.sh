#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_17_18_18.out
#SBATCH --error=granger/100_nodes_interleave/script_17_18_18.err
#SBATCH --job-name="18-18"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 18 -e 18 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 118 -e 118 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 218 -e 218 -a &> /dev/null
date +%s%N
