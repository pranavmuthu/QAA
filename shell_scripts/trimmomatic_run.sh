#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1   
#SBATCH --nodelist=n226         ### Run on node 226

conda activate QAA

in_dir=/projects/bgmp/pmuthura/bioinfo/Bi623/QAA/cutadapt
out_dir=/projects/bgmp/pmuthura/bioinfo/Bi623/QAA/trimmed

/usr/bin/time -v trimmomatic PE -phred33 \
$in_dir/8_2F_fox_S7_L008_R1_001.adaptertrimmed.fastq.gz \
$in_dir/8_2F_fox_S7_L008_R2_001.adaptertrimmed.fastq.gz \
$out_dir/8_2F_fox_S7_L008_R1_001.trimmed.paired.fastq.gz \
$out_dir/8_2F_fox_S7_L008_R1_001.trimmed.unpaired.fastq.gz \
$out_dir/8_2F_fox_S7_L008_R2_001.trimmed.paired.fastq.gz \
$out_dir/8_2F_fox_S7_L008_R2_001.trimmed.unpaired.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

/usr/bin/time -v trimmomatic PE -phred33 \
$in_dir/14_3B_control_S10_L008_R1_001.adaptertrimmed.fastq.gz \
$in_dir/14_3B_control_S10_L008_R2_001.adaptertrimmed.fastq.gz \
$out_dir/14_3B_control_S10_L008_R1_001.trimmed.paired.fastq.gz \
$out_dir/14_3B_control_S10_L008_R1_001.trimmed.unpaired.fastq.gz \
$out_dir/14_3B_control_S10_L008_R2_001.trimmed.paired.fastq.gz \
$out_dir/14_3B_control_S10_L008_R2_001.trimmed.unpaired.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

exit