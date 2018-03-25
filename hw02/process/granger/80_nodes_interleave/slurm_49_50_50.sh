#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_49_50_50.out
#SBATCH --error=granger/80_nodes_interleave/script_49_50_50.err
#SBATCH --job-name="50-50"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 50 -e 50 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 130 -e 130 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 210 -e 210 -a &> /dev/null
date +%s%N
