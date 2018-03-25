#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_85_86_86.out
#SBATCH --error=granger/100_nodes_interleave/script_85_86_86.err
#SBATCH --job-name="86-86"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 86 -e 86 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 186 -e 186 -a &> /dev/null
date +%s%N
