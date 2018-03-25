#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_5_6_6.out
#SBATCH --error=slurm/22_nodes_interleave/script_5_6_6.err
#SBATCH --job-name="6-6"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 6 -e 6 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 28 -e 28 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 50 -e 50 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 72 -e 72 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 94 -e 94 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 116 -e 116 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 138 -e 138 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 160 -e 160 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 182 -e 182 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 204 -e 204 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 226 -e 226 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 248 -e 248 -a &> /dev/null
date +%s%N
