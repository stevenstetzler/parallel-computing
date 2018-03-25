#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes_interleave/script_16_17_17.out
#SBATCH --error=granger/40_nodes_interleave/script_16_17_17.err
#SBATCH --job-name="17-17"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 17 -e 17 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 57 -e 57 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 97 -e 97 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 137 -e 137 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 177 -e 177 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 217 -e 217 -a &> /dev/null
date +%s%N
