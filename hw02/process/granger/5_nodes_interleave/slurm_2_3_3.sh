#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/5_nodes_interleave/script_2_3_3.out
#SBATCH --error=granger/5_nodes_interleave/script_2_3_3.err
#SBATCH --job-name="3-3"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 3 -e 3 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 8 -e 8 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 13 -e 13 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 18 -e 18 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 23 -e 23 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 28 -e 28 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 33 -e 33 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 38 -e 38 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 43 -e 43 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 48 -e 48 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 53 -e 53 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 58 -e 58 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 63 -e 63 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 68 -e 68 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 73 -e 73 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 78 -e 78 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 83 -e 83 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 88 -e 88 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 93 -e 93 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 98 -e 98 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 103 -e 103 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 108 -e 108 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 113 -e 113 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 118 -e 118 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 123 -e 123 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 128 -e 128 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 133 -e 133 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 138 -e 138 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 143 -e 143 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 148 -e 148 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 153 -e 153 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 158 -e 158 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 163 -e 163 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 168 -e 168 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 173 -e 173 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 178 -e 178 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 183 -e 183 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 188 -e 188 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 193 -e 193 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 198 -e 198 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 203 -e 203 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 208 -e 208 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 213 -e 213 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 218 -e 218 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 223 -e 223 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 228 -e 228 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 233 -e 233 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 238 -e 238 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 243 -e 243 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 248 -e 248 -a &> /dev/null
date +%s%N
