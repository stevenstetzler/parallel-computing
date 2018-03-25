#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_11_12_12.out
#SBATCH --error=granger/30_nodes_interleave/script_11_12_12.err
#SBATCH --job-name="12-12"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 12 -e 12 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 42 -e 42 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 72 -e 72 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 102 -e 102 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 132 -e 132 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 162 -e 162 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 192 -e 192 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 222 -e 222 -a &> /dev/null
date +%s%N
