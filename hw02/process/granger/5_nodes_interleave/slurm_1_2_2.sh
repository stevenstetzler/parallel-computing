#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/5_nodes_interleave/script_1_2_2.out
#SBATCH --error=granger/5_nodes_interleave/script_1_2_2.err
#SBATCH --job-name="2-2"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 2 -e 2 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 7 -e 7 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 12 -e 12 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 17 -e 17 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 22 -e 22 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 27 -e 27 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 32 -e 32 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 37 -e 37 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 42 -e 42 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 47 -e 47 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 52 -e 52 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 57 -e 57 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 62 -e 62 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 67 -e 67 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 72 -e 72 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 77 -e 77 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 82 -e 82 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 87 -e 87 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 92 -e 92 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 97 -e 97 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 102 -e 102 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 107 -e 107 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 112 -e 112 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 117 -e 117 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 122 -e 122 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 127 -e 127 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 132 -e 132 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 137 -e 137 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 142 -e 142 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 147 -e 147 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 152 -e 152 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 157 -e 157 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 162 -e 162 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 167 -e 167 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 172 -e 172 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 177 -e 177 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 182 -e 182 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 187 -e 187 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 192 -e 192 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 197 -e 197 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 202 -e 202 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 207 -e 207 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 212 -e 212 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 217 -e 217 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 222 -e 222 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 227 -e 227 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 232 -e 232 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 237 -e 237 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 242 -e 242 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 247 -e 247 -a &> /dev/null
date +%s%N
