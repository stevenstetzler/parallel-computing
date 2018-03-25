#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_57_58_58.out
#SBATCH --error=granger/80_nodes_interleave/script_57_58_58.err
#SBATCH --job-name="58-58"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 58 -e 58 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 138 -e 138 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 218 -e 218 -a &> /dev/null
date +%s%N
