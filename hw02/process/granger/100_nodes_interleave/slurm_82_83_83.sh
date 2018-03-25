#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_82_83_83.out
#SBATCH --error=granger/100_nodes_interleave/script_82_83_83.err
#SBATCH --job-name="83-83"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 83 -e 83 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 183 -e 183 -a &> /dev/null
date +%s%N
