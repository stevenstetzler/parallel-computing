#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_25_26_26.out
#SBATCH --error=granger/100_nodes_interleave/script_25_26_26.err
#SBATCH --job-name="26-26"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 26 -e 26 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 126 -e 126 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 226 -e 226 -a &> /dev/null
date +%s%N
