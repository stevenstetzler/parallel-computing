#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/10_nodes_interleave/script_3_4_4.out
#SBATCH --error=granger/10_nodes_interleave/script_3_4_4.err
#SBATCH --job-name="4-4"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 4 -e 4 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 14 -e 14 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 24 -e 24 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 34 -e 34 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 44 -e 44 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 54 -e 54 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 64 -e 64 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 74 -e 74 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 84 -e 84 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 94 -e 94 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 104 -e 104 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 114 -e 114 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 124 -e 124 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 134 -e 134 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 144 -e 144 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 154 -e 154 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 164 -e 164 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 174 -e 174 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 184 -e 184 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 194 -e 194 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 204 -e 204 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 214 -e 214 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 224 -e 224 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 234 -e 234 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 244 -e 244 -a &> /dev/null
date +%s%N
