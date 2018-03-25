#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/10_nodes_interleave/script_7_8_8.out
#SBATCH --error=granger/10_nodes_interleave/script_7_8_8.err
#SBATCH --job-name="8-8"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 8 -e 8 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 18 -e 18 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 28 -e 28 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 38 -e 38 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 48 -e 48 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 58 -e 58 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 68 -e 68 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 78 -e 78 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 88 -e 88 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 98 -e 98 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 108 -e 108 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 118 -e 118 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 128 -e 128 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 138 -e 138 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 148 -e 148 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 158 -e 158 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 168 -e 168 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 178 -e 178 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 188 -e 188 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 198 -e 198 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 208 -e 208 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 218 -e 218 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 228 -e 228 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 238 -e 238 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 248 -e 248 -a &> /dev/null
date +%s%N
