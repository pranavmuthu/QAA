QUESTION 1
For the per-base quality scores, the read1 files for both fox and control start a bit lower, then remain very high for the entire read. For the read2 files, fox starts a bit lower and has consistently lower quality throughout. The control starts even lower than the fox file, but improves to the same level after the 5th base pair. All 4 quality scores received a green passing mark. In all files, the N distributions are very low.

QUESTION 2
All the distribution plots created by the python script look very similar to the ones created by FASTQC. The runtime to create each of these plots were: 21 mins, 21 mins, 3 mins, and 3 mins, respectively. The runtime of the entire fastQC was only 8 mins. FastQC may have run more quickly because it is able to read multiple files at once.

QUESTION 3
Overall, the FOX files have better data quality than the CONTROL due to the quality scores. In both sets of data, the read 1 files have significantly better quality scores than the read 2 files.

QUESTION 5
8_2F_fox:
Total read pairs processed: 36,482,601
  Read 1 with adapter: 2,145,600 (5.9%)
  Read 2 with adapter: 2,403,490 (6.6%)
Pairs written (passing filters):36,482,601 (100.0%)

14_3B_control:
Total read pairs processed: 4,440,378
  Read 1 with adapter: 264,208 (6.0%)
  Read 2 with adapter: 299,716 (6.7%)
Pairs written (passing filters): 4,440,378 (100.0%)


QUESTION 7
We can see that in both libraries, read 2 is trimmed slightly more often than read 1. The adapter trimming rates should be about the same as they are dependent on insert length, and both reads of each library should have the same insert length. The small difference between read 1 and read 2 are probably due to the quality trimming rates, and we know that read 2 is of slighlty lower quality than read 1.

QUESTION 12
I can propose that these libraries are indeed strand specific as 80% of the fox reads mapped to features on the reverse strand and 86% of the control reads mapped to features on the reverse strand. This tells us that a majority of the reads are specific to the reverse strand. If this was an unstranded kit, we would have roughly the same amount on both the forward and reverse strand.



  
  
