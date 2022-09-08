#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1   
#SBATCH --cpus-per-task=8       ### Number of cpus (cores) per task
#SBATCH --nodelist=n226         ### Run on node 226

conda activate QAA

/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a \
--genomeFastaFiles /projects/bgmp/pmuthura/bioinfo/Bi623/QAA/mus/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/pmuthura/bioinfo/Bi623/QAA/mus/Mus_musculus.GRCm39.107.gtf

exit

