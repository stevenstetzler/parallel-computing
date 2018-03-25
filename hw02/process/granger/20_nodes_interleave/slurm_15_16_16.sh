#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_15_16_16.out
#SBATCH --error=granger/20_nodes_interleave/script_15_16_16.err
#SBATCH --job-name="16-16"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 16 -e 16 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 36 -e 36 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 56 -e 56 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 76 -e 76 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 96 -e 96 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 116 -e 116 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 136 -e 136 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 156 -e 156 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 176 -e 176 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 196 -e 196 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 216 -e 216 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 236 -e 236 -a &> /dev/null
date +%s%N
