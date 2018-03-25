#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_12_13_13.out
#SBATCH --error=slurm/22_nodes_interleave/script_12_13_13.err
#SBATCH --job-name="13-13"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 13 -e 13 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 35 -e 35 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 57 -e 57 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 79 -e 79 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 101 -e 101 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 123 -e 123 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 145 -e 145 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 167 -e 167 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 189 -e 189 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 211 -e 211 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 233 -e 233 -a &> /dev/null
date +%s%N
