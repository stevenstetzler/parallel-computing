#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_6_7_7.out
#SBATCH --error=slurm/22_nodes_interleave/script_6_7_7.err
#SBATCH --job-name="7-7"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 7 -e 7 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 29 -e 29 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 51 -e 51 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 73 -e 73 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 95 -e 95 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 117 -e 117 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 139 -e 139 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 161 -e 161 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 183 -e 183 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 205 -e 205 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 227 -e 227 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 249 -e 249 -a &> /dev/null
date +%s%N
