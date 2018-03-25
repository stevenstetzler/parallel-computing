#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes_interleave/script_28_29_29.out
#SBATCH --error=granger/60_nodes_interleave/script_28_29_29.err
#SBATCH --job-name="29-29"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 29 -e 29 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 89 -e 89 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 149 -e 149 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 209 -e 209 -a &> /dev/null
date +%s%N
