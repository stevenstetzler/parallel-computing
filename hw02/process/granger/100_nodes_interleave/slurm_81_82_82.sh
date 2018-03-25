#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_81_82_82.out
#SBATCH --error=granger/100_nodes_interleave/script_81_82_82.err
#SBATCH --job-name="82-82"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 82 -e 82 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 182 -e 182 -a &> /dev/null
date +%s%N
