#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_23_24_24.out
#SBATCH --error=granger/30_nodes_interleave/script_23_24_24.err
#SBATCH --job-name="24-24"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 24 -e 24 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 54 -e 54 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 84 -e 84 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 114 -e 114 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 144 -e 144 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 174 -e 174 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 204 -e 204 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 234 -e 234 -a &> /dev/null
date +%s%N
