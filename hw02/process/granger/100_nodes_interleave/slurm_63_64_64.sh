#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_63_64_64.out
#SBATCH --error=granger/100_nodes_interleave/script_63_64_64.err
#SBATCH --job-name="64-64"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 64 -e 64 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 164 -e 164 -a &> /dev/null
date +%s%N
