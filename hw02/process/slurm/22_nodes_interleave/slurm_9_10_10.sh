#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_9_10_10.out
#SBATCH --error=slurm/22_nodes_interleave/script_9_10_10.err
#SBATCH --job-name="10-10"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 10 -e 10 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 32 -e 32 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 54 -e 54 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 76 -e 76 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 98 -e 98 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 120 -e 120 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 142 -e 142 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 164 -e 164 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 186 -e 186 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 208 -e 208 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 230 -e 230 -a &> /dev/null
date +%s%N
