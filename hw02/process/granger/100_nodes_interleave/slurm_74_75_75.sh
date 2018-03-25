#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_74_75_75.out
#SBATCH --error=granger/100_nodes_interleave/script_74_75_75.err
#SBATCH --job-name="75-75"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 75 -e 75 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 175 -e 175 -a &> /dev/null
date +%s%N
