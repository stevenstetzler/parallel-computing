#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_8_9_9.out
#SBATCH --error=granger/20_nodes_interleave/script_8_9_9.err
#SBATCH --job-name="9-9"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 9 -e 9 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 29 -e 29 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 49 -e 49 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 69 -e 69 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 89 -e 89 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 109 -e 109 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 129 -e 129 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 149 -e 149 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 169 -e 169 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 189 -e 189 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 209 -e 209 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 229 -e 229 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 249 -e 249 -a &> /dev/null
date +%s%N
