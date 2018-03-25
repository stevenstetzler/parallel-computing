#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/40_nodes_interleave/script_6_7_7.out
#SBATCH --error=granger/40_nodes_interleave/script_6_7_7.err
#SBATCH --job-name="7-7"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 7 -e 7 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 47 -e 47 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 87 -e 87 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 127 -e 127 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 167 -e 167 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 207 -e 207 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 247 -e 247 -a &> /dev/null
date +%s%N
