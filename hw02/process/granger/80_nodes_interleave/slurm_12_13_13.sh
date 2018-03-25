#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_12_13_13.out
#SBATCH --error=granger/80_nodes_interleave/script_12_13_13.err
#SBATCH --job-name="13-13"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 13 -e 13 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 93 -e 93 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 173 -e 173 -a &> /dev/null
date +%s%N
