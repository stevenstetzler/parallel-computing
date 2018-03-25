#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes_interleave/script_46_47_47.out
#SBATCH --error=granger/60_nodes_interleave/script_46_47_47.err
#SBATCH --job-name="47-47"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 47 -e 47 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 107 -e 107 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 167 -e 167 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 227 -e 227 -a &> /dev/null
date +%s%N
