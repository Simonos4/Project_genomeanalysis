#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 06:00:00
#SBATCH -J 0401_bwa_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa

# Variables
INPUT="/home/simonos/Genomeanalysis/data/raw_data/RNA_trimmed_reads"
OUTPUT="/home/simonos/Genomeanalysis/analysis/mapped_RNA"
REF="/home/simonos/Genomeanalysis/data/raw_data/reference/OBMB01.fasta"

# Your commands
bwa index $REF -p ref_index

for i in ${INPUT}/*P1*
do
  sample=$(basename "$i" "_P1.trim.fastq.gz")
  bwa mem ref_index $INPUT/${sample}_P1.trim.fastq.gz $INPUT/${sample}_P2.trim.fastq.gz \
  > ${OUTPUT}/${sample}_bwa_alignments.sam
  gzip ${OUTPUT}/${sample}_bwa_alignments.sam 
done
