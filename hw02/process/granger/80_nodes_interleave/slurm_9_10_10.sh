#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_9_10_10.out
#SBATCH --error=granger/80_nodes_interleave/script_9_10_10.err
#SBATCH --job-name="10-10"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 10 -e 10 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 90 -e 90 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 170 -e 170 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 250 -e 250 -a &> /dev/null
date +%s%N
