#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes_interleave/script_55_56_56.out
#SBATCH --error=granger/60_nodes_interleave/script_55_56_56.err
#SBATCH --job-name="56-56"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 56 -e 56 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 116 -e 116 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 176 -e 176 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 236 -e 236 -a &> /dev/null
date +%s%N
