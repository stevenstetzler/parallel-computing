#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_1_2_2.out
#SBATCH --error=slurm/22_nodes_interleave/script_1_2_2.err
#SBATCH --job-name="2-2"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 2 -e 2 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 24 -e 24 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 46 -e 46 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 68 -e 68 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 90 -e 90 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 112 -e 112 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 134 -e 134 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 156 -e 156 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 178 -e 178 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 200 -e 200 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 222 -e 222 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 244 -e 244 -a &> /dev/null
date +%s%N
