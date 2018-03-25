#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_11_12_12.out
#SBATCH --error=granger/20_nodes_interleave/script_11_12_12.err
#SBATCH --job-name="12-12"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 12 -e 12 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 32 -e 32 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 52 -e 52 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 72 -e 72 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 92 -e 92 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 112 -e 112 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 132 -e 132 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 152 -e 152 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 172 -e 172 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 192 -e 192 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 212 -e 212 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 232 -e 232 -a &> /dev/null
date +%s%N
