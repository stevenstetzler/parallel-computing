#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_15_16_16.out
#SBATCH --error=granger/80_nodes_interleave/script_15_16_16.err
#SBATCH --job-name="16-16"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 16 -e 16 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 96 -e 96 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 176 -e 176 -a &> /dev/null
date +%s%N
