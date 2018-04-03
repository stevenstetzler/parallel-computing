#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_14_15_15.out
#SBATCH --error=granger/30_nodes_interleave/script_14_15_15.err
#SBATCH --job-name="15-15"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 15 -e 15 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 45 -e 45 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 75 -e 75 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 105 -e 105 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 135 -e 135 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 165 -e 165 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 195 -e 195 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 225 -e 225 -a &> /dev/null
date +%s%N