#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_19_20_20.out
#SBATCH --error=slurm/22_nodes_interleave/script_19_20_20.err
#SBATCH --job-name="20-20"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 20 -e 20 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 42 -e 42 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 64 -e 64 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 86 -e 86 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 108 -e 108 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 130 -e 130 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 152 -e 152 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 174 -e 174 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 196 -e 196 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 218 -e 218 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 240 -e 240 -a &> /dev/null
date +%s%N
