#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_20_21_21.out
#SBATCH --error=granger/80_nodes_interleave/script_20_21_21.err
#SBATCH --job-name="21-21"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 21 -e 21 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 101 -e 101 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 181 -e 181 -a &> /dev/null
date +%s%N
