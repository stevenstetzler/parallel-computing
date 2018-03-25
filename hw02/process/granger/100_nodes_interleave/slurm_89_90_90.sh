#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_89_90_90.out
#SBATCH --error=granger/100_nodes_interleave/script_89_90_90.err
#SBATCH --job-name="90-90"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 90 -e 90 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 190 -e 190 -a &> /dev/null
date +%s%N
