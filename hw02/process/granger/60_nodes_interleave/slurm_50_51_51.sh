#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes_interleave/script_50_51_51.out
#SBATCH --error=granger/60_nodes_interleave/script_50_51_51.err
#SBATCH --job-name="51-51"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 51 -e 51 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 111 -e 111 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 171 -e 171 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 231 -e 231 -a &> /dev/null
date +%s%N
