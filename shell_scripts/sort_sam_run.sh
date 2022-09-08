#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00

#sort sam files by name in order to run HTSeq-count later

conda activate QAA

/usr/bin/time -v samtools view -u aligned/8_2F_fox_S7_L008_Aligned.out.sam | \
samtools sort -n | \
samtools view -h -o aligned/8_2F_fox_S7_L008_Aligned.sorted.sam

/usr/bin/time -v samtools view -u aligned/14_3B_control_S10_L008_Aligned.out.sam | \
samtools sort -n | \
samtools view -h -o aligned/14_3B_control_S10_L008_Aligned.sorted.sam

exit