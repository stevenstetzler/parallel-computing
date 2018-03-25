#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_29_30_30.out
#SBATCH --error=granger/80_nodes_interleave/script_29_30_30.err
#SBATCH --job-name="30-30"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 30 -e 30 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 110 -e 110 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 190 -e 190 -a &> /dev/null
date +%s%N
