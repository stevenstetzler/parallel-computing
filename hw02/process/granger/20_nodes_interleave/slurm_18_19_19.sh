#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_18_19_19.out
#SBATCH --error=granger/20_nodes_interleave/script_18_19_19.err
#SBATCH --job-name="19-19"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 19 -e 19 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 39 -e 39 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 59 -e 59 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 79 -e 79 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 99 -e 99 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 119 -e 119 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 139 -e 139 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 159 -e 159 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 179 -e 179 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 199 -e 199 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 219 -e 219 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 239 -e 239 -a &> /dev/null
date +%s%N
