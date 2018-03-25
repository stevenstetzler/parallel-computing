#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_83_84_84.out
#SBATCH --error=granger/100_nodes_interleave/script_83_84_84.err
#SBATCH --job-name="84-84"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 84 -e 84 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 184 -e 184 -a &> /dev/null
date +%s%N
