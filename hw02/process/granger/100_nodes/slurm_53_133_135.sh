#!/bin/bash
#SBATCH --exclude=hermes[1-4],trillian[1-3],artemis[1-7],qdata[1-8],nibbler[1-4],slurm[1-5]
#SBATCH --output=granger/100_nodes/script_53_133_135.out
#SBATCH --error=granger/100_nodes/script_53_133_135.err
#SBATCH --job-name="133-135"
hostname
date +%s%N
time blender -t 1 -b Star-collapse-ntsc.blend -s 133 -e 135 -a &> /dev/null
date +%s%N
