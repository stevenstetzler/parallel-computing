#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_21_22_22.out
#SBATCH --error=slurm/22_nodes_interleave/script_21_22_22.err
#SBATCH --job-name="22-22"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 22 -e 22 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 44 -e 44 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 66 -e 66 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 88 -e 88 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 110 -e 110 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 132 -e 132 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 154 -e 154 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 176 -e 176 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 198 -e 198 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 220 -e 220 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 242 -e 242 -a &> /dev/null
date +%s%N
