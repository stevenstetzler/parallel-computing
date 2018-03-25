#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_20_21_21.out
#SBATCH --error=slurm/22_nodes_interleave/script_20_21_21.err
#SBATCH --job-name="21-21"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 21 -e 21 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 43 -e 43 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 65 -e 65 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 87 -e 87 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 109 -e 109 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 131 -e 131 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 153 -e 153 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 175 -e 175 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 197 -e 197 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 219 -e 219 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 241 -e 241 -a &> /dev/null
date +%s%N
