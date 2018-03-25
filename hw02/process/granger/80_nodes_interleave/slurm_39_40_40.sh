#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_39_40_40.out
#SBATCH --error=granger/80_nodes_interleave/script_39_40_40.err
#SBATCH --job-name="40-40"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 40 -e 40 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 120 -e 120 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 200 -e 200 -a &> /dev/null
date +%s%N
