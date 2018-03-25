#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_40_41_41.out
#SBATCH --error=granger/100_nodes_interleave/script_40_41_41.err
#SBATCH --job-name="41-41"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 41 -e 41 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 141 -e 141 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 241 -e 241 -a &> /dev/null
date +%s%N
