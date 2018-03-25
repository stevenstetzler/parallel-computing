#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_18_19_19.out
#SBATCH --error=granger/80_nodes_interleave/script_18_19_19.err
#SBATCH --job-name="19-19"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 19 -e 19 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 99 -e 99 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 179 -e 179 -a &> /dev/null
date +%s%N
