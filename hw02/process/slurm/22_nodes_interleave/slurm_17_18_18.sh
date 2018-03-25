#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_17_18_18.out
#SBATCH --error=slurm/22_nodes_interleave/script_17_18_18.err
#SBATCH --job-name="18-18"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 18 -e 18 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 40 -e 40 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 62 -e 62 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 84 -e 84 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 106 -e 106 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 128 -e 128 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 150 -e 150 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 172 -e 172 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 194 -e 194 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 216 -e 216 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 238 -e 238 -a &> /dev/null
date +%s%N
