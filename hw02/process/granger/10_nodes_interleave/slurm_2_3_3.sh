#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/10_nodes_interleave/script_2_3_3.out
#SBATCH --error=granger/10_nodes_interleave/script_2_3_3.err
#SBATCH --job-name="3-3"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 3 -e 3 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 13 -e 13 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 23 -e 23 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 33 -e 33 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 43 -e 43 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 53 -e 53 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 63 -e 63 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 73 -e 73 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 83 -e 83 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 93 -e 93 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 103 -e 103 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 113 -e 113 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 123 -e 123 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 133 -e 133 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 143 -e 143 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 153 -e 153 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 163 -e 163 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 173 -e 173 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 183 -e 183 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 193 -e 193 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 203 -e 203 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 213 -e 213 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 223 -e 223 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 233 -e 233 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 243 -e 243 -a &> /dev/null
date +%s%N
