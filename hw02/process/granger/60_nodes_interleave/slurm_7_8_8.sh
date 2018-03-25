#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes_interleave/script_7_8_8.out
#SBATCH --error=granger/60_nodes_interleave/script_7_8_8.err
#SBATCH --job-name="8-8"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 8 -e 8 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 68 -e 68 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 128 -e 128 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 188 -e 188 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 248 -e 248 -a &> /dev/null
date +%s%N
