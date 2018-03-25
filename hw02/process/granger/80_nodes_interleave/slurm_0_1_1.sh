#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_0_1_1.out
#SBATCH --error=granger/80_nodes_interleave/script_0_1_1.err
#SBATCH --job-name="1-1"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 1 -e 1 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 81 -e 81 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 161 -e 161 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 241 -e 241 -a &> /dev/null
date +%s%N
