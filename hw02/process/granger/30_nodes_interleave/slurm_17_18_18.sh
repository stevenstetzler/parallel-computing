#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_17_18_18.out
#SBATCH --error=granger/30_nodes_interleave/script_17_18_18.err
#SBATCH --job-name="18-18"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 18 -e 18 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 48 -e 48 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 78 -e 78 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 108 -e 108 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 138 -e 138 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 168 -e 168 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 198 -e 198 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 228 -e 228 -a &> /dev/null
date +%s%N
