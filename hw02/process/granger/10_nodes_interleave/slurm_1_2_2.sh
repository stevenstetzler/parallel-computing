#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/10_nodes_interleave/script_1_2_2.out
#SBATCH --error=granger/10_nodes_interleave/script_1_2_2.err
#SBATCH --job-name="2-2"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 2 -e 2 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 12 -e 12 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 22 -e 22 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 32 -e 32 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 42 -e 42 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 52 -e 52 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 62 -e 62 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 72 -e 72 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 82 -e 82 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 92 -e 92 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 102 -e 102 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 112 -e 112 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 122 -e 122 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 132 -e 132 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 142 -e 142 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 152 -e 152 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 162 -e 162 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 172 -e 172 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 182 -e 182 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 192 -e 192 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 202 -e 202 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 212 -e 212 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 222 -e 222 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 232 -e 232 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 242 -e 242 -a &> /dev/null
date +%s%N
