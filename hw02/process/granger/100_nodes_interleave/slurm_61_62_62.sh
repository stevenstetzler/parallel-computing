#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_61_62_62.out
#SBATCH --error=granger/100_nodes_interleave/script_61_62_62.err
#SBATCH --job-name="62-62"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 62 -e 62 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 162 -e 162 -a &> /dev/null
date +%s%N
