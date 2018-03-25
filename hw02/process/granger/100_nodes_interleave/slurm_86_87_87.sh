#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_86_87_87.out
#SBATCH --error=granger/100_nodes_interleave/script_86_87_87.err
#SBATCH --job-name="87-87"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 87 -e 87 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 187 -e 187 -a &> /dev/null
date +%s%N
