#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_4_5_5.out
#SBATCH --error=slurm/22_nodes_interleave/script_4_5_5.err
#SBATCH --job-name="5-5"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 5 -e 5 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 27 -e 27 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 49 -e 49 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 71 -e 71 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 93 -e 93 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 115 -e 115 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 137 -e 137 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 159 -e 159 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 181 -e 181 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 203 -e 203 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 225 -e 225 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 247 -e 247 -a &> /dev/null
date +%s%N
