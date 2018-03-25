#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_22_23_23.out
#SBATCH --error=granger/80_nodes_interleave/script_22_23_23.err
#SBATCH --job-name="23-23"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 23 -e 23 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 103 -e 103 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 183 -e 183 -a &> /dev/null
date +%s%N
