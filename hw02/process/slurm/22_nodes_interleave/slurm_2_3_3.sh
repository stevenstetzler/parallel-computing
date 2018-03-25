#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_2_3_3.out
#SBATCH --error=slurm/22_nodes_interleave/script_2_3_3.err
#SBATCH --job-name="3-3"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 3 -e 3 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 25 -e 25 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 47 -e 47 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 69 -e 69 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 91 -e 91 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 113 -e 113 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 135 -e 135 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 157 -e 157 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 179 -e 179 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 201 -e 201 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 223 -e 223 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 245 -e 245 -a &> /dev/null
date +%s%N
