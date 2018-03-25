#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/20_nodes_interleave/script_10_11_11.out
#SBATCH --error=granger/20_nodes_interleave/script_10_11_11.err
#SBATCH --job-name="11-11"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 11 -e 11 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 31 -e 31 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 51 -e 51 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 71 -e 71 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 91 -e 91 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 111 -e 111 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 131 -e 131 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 151 -e 151 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 171 -e 171 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 191 -e 191 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 211 -e 211 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 231 -e 231 -a &> /dev/null
date +%s%N
