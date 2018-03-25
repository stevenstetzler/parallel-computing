#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_13_14_14.out
#SBATCH --error=granger/20_nodes_interleave/script_13_14_14.err
#SBATCH --job-name="14-14"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 14 -e 14 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 34 -e 34 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 54 -e 54 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 74 -e 74 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 94 -e 94 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 114 -e 114 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 134 -e 134 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 154 -e 154 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 174 -e 174 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 194 -e 194 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 214 -e 214 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 234 -e 234 -a &> /dev/null
date +%s%N
