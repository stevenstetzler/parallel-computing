#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_23_24_24.out
#SBATCH --error=granger/100_nodes_interleave/script_23_24_24.err
#SBATCH --job-name="24-24"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 24 -e 24 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 124 -e 124 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 224 -e 224 -a &> /dev/null
date +%s%N
