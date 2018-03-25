#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_78_79_79.out
#SBATCH --error=granger/80_nodes_interleave/script_78_79_79.err
#SBATCH --job-name="79-79"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 79 -e 79 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 159 -e 159 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 239 -e 239 -a &> /dev/null
date +%s%N
