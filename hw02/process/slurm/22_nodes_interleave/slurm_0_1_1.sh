#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_0_1_1.out
#SBATCH --error=slurm/22_nodes_interleave/script_0_1_1.err
#SBATCH --job-name="1-1"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 1 -e 1 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 23 -e 23 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 45 -e 45 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 67 -e 67 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 89 -e 89 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 111 -e 111 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 133 -e 133 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 155 -e 155 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 177 -e 177 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 199 -e 199 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 221 -e 221 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 243 -e 243 -a &> /dev/null
date +%s%N
