#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_51_52_52.out
#SBATCH --error=granger/80_nodes_interleave/script_51_52_52.err
#SBATCH --job-name="52-52"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 52 -e 52 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 132 -e 132 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 212 -e 212 -a &> /dev/null
date +%s%N
