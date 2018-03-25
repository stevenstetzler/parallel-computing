#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes_interleave/script_67_68_68.out
#SBATCH --error=granger/100_nodes_interleave/script_67_68_68.err
#SBATCH --job-name="68-68"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 68 -e 68 -a &> /dev/null
time blender -t 1 -b Star-collapse-ntsc.blend -s 168 -e 168 -a &> /dev/null
date +%s%N
