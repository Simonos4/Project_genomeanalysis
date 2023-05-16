#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J 0301_trimmomatic_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

# Load modules
module load bioinfo-tools
module load trimmomatic

# Variables
INPUT="/home/simonos/Genomeanalysis/data/raw_data/RNA_raw_data/"
OUTPUT="/home/simonos/Genomeanalysis/analysis/trimmed_RNA"

# Your commands
trimmomatic PE $INPUT/ERR2036629_1.fastq.gz $INPUT/ERR2036629_2.fastq.gz \
 $OUTPUT/out_for_pair $OUTPUT/out_for_un_pair $OUTPUT/out_rev_pair $OUTPUT/out_rev_un_pair \
 ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

