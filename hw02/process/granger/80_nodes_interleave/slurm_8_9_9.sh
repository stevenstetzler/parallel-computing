#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_8_9_9.out
#SBATCH --error=granger/80_nodes_interleave/script_8_9_9.err
#SBATCH --job-name="9-9"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 9 -e 9 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 89 -e 89 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 169 -e 169 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 249 -e 249 -a &> /dev/null
date +%s%N
