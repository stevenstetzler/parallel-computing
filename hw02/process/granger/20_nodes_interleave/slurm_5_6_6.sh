#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_5_6_6.out
#SBATCH --error=granger/20_nodes_interleave/script_5_6_6.err
#SBATCH --job-name="6-6"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 6 -e 6 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 26 -e 26 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 46 -e 46 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 66 -e 66 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 86 -e 86 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 106 -e 106 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 126 -e 126 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 146 -e 146 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 166 -e 166 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 186 -e 186 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 206 -e 206 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 226 -e 226 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 246 -e 246 -a &> /dev/null
date +%s%N
