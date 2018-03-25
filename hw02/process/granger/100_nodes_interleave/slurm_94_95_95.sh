#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_94_95_95.out
#SBATCH --error=granger/100_nodes_interleave/script_94_95_95.err
#SBATCH --job-name="95-95"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 95 -e 95 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 195 -e 195 -a &> /dev/null
date +%s%N
