#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1   
#SBATCH --nodelist=n226         ### Run on node 226

conda activate QAA

/usr/bin/time -v htseq-count -s yes \
aligned/8_2F_fox_S7_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.107.gtf \
> aligned/8_2F_fox_S7_L008.stranded.genecount

/usr/bin/time -v htseq-count -s reverse \
aligned/8_2F_fox_S7_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.107.gtf \
> aligned/8_2F_fox_S7_L008.reverse.genecount

/usr/bin/time -v htseq-count -s yes \
aligned/14_3B_control_S10_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.107.gtf \
> aligned/14_3B_control_S10_L008.stranded.genecount

/usr/bin/time -v htseq-count -s reverse \
aligned/14_3B_control_S10_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.107.gtf \
> aligned/14_3B_control_S10_L008.reverse.genecount

exit