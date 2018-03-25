#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_31_32_32.out
#SBATCH --error=granger/80_nodes_interleave/script_31_32_32.err
#SBATCH --job-name="32-32"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 32 -e 32 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 112 -e 112 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 192 -e 192 -a &> /dev/null
date +%s%N
