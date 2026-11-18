#!/bin/bash
# Cell Ranger commands used on UPPMAX/PDC (one library shown as an example)

#as an example

# For single cell
ml bioinfo-tools cellranger/7.0.1

cellranger count --id=P29885_1001_S9 --transcriptome=/proj/snic2022-22-1083/private/ref/GRCm39 --fastqs=/proj/naiss2023-23-127/private/AEC/data20231030/files/P29885/P29885_1001/02-FASTQ/20231006_LH00217_0012_B22CKMMLT3/ --sample=P29885_1001 --localmem=60

# For OCM
ml cellranger/9.0.1

cellranger multi --id=Set1   --csv=/cfs/klemming/projects/supr/naiss2023-23-127/private/AEC_OCM/fastq/set1.csv
