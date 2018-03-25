#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_8_9_9.out
#SBATCH --error=slurm/22_nodes_interleave/script_8_9_9.err
#SBATCH --job-name="9-9"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 9 -e 9 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 31 -e 31 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 53 -e 53 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 75 -e 75 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 97 -e 97 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 119 -e 119 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 141 -e 141 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 163 -e 163 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 185 -e 185 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 207 -e 207 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 229 -e 229 -a &> /dev/null
date +%s%N
