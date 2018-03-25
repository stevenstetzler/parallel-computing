#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_30_31_31.out
#SBATCH --error=granger/100_nodes_interleave/script_30_31_31.err
#SBATCH --job-name="31-31"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 31 -e 31 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 131 -e 131 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 231 -e 231 -a &> /dev/null
date +%s%N
