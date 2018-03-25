#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_95_96_96.out
#SBATCH --error=granger/100_nodes_interleave/script_95_96_96.err
#SBATCH --job-name="96-96"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 96 -e 96 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 196 -e 196 -a &> /dev/null
date +%s%N
