#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_21_22_22.out
#SBATCH --error=granger/30_nodes_interleave/script_21_22_22.err
#SBATCH --job-name="22-22"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 22 -e 22 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 52 -e 52 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 82 -e 82 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 112 -e 112 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 142 -e 142 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 172 -e 172 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 202 -e 202 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 232 -e 232 -a &> /dev/null
date +%s%N
