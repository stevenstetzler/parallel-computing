#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_0_1_1.out
#SBATCH --error=granger/20_nodes_interleave/script_0_1_1.err
#SBATCH --job-name="1-1"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 1 -e 1 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 21 -e 21 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 41 -e 41 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 61 -e 61 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 81 -e 81 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 101 -e 101 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 121 -e 121 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 141 -e 141 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 161 -e 161 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 181 -e 181 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 201 -e 201 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 221 -e 221 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 241 -e 241 -a &> /dev/null
date +%s%N
