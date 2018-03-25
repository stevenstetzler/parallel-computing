#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],granger[1-8],nibbler[1-4]
#SBATCH --output=slurm/22_nodes_interleave/script_14_15_15.out
#SBATCH --error=slurm/22_nodes_interleave/script_14_15_15.err
#SBATCH --job-name="15-15"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 15 -e 15 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 37 -e 37 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 59 -e 59 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 81 -e 81 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 103 -e 103 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 125 -e 125 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 147 -e 147 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 169 -e 169 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 191 -e 191 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 213 -e 213 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 235 -e 235 -a &> /dev/null
date +%s%N
