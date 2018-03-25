#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_66_67_67.out
#SBATCH --error=granger/100_nodes_interleave/script_66_67_67.err
#SBATCH --job-name="67-67"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 67 -e 67 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 167 -e 167 -a &> /dev/null
date +%s%N
