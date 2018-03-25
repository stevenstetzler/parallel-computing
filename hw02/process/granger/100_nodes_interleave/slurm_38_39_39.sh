#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_38_39_39.out
#SBATCH --error=granger/100_nodes_interleave/script_38_39_39.err
#SBATCH --job-name="39-39"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 39 -e 39 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 139 -e 139 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 239 -e 239 -a &> /dev/null
date +%s%N
