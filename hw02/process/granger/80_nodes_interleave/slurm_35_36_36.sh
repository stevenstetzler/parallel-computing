#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_35_36_36.out
#SBATCH --error=granger/80_nodes_interleave/script_35_36_36.err
#SBATCH --job-name="36-36"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 36 -e 36 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 116 -e 116 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 196 -e 196 -a &> /dev/null
date +%s%N
