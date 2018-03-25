#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/80_nodes_interleave/script_52_53_53.out
#SBATCH --error=granger/80_nodes_interleave/script_52_53_53.err
#SBATCH --job-name="53-53"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 53 -e 53 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 133 -e 133 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 213 -e 213 -a &> /dev/null
date +%s%N
