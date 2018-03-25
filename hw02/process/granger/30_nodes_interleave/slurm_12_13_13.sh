#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/30_nodes_interleave/script_12_13_13.out
#SBATCH --error=granger/30_nodes_interleave/script_12_13_13.err
#SBATCH --job-name="13-13"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 13 -e 13 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 43 -e 43 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 73 -e 73 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 103 -e 103 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 133 -e 133 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 163 -e 163 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 193 -e 193 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 223 -e 223 -a &> /dev/null
date +%s%N
