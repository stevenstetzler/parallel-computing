#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/60_nodes_interleave/script_37_38_38.out
#SBATCH --error=granger/60_nodes_interleave/script_37_38_38.err
#SBATCH --job-name="38-38"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 38 -e 38 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 98 -e 98 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 158 -e 158 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 218 -e 218 -a &> /dev/null
date +%s%N
