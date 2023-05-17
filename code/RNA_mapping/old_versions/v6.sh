#!/bin/bash -l

#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 04:00:00
#SBATCH -J 0401_bwa_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

cat $0
echo USER = $USER
echo QOS = $SLURM_JOB_QOS

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Variables
INPUT="/home/simonos/Genomeanalysis/data/raw_data/RNA_trimmed_reads"
OUTPUT="/home/simonos/Genomeanalysis/analysis/mapped_RNA"
REF="/home/simonos/Genomeanalysis/data/raw_data/reference/OBMB01.fasta"

# Your commands
bwa index $REF -p ref_index

run() {
  sample=($basename $file _P1.trim.fastq.gz) \
  fil1="${sample}_P1.trim.fastq.gz" \
  fil2="${sample}_P2.trim.fastq.gz" \
  bwa mem ref_index $INPUT/${fil1} $INPUT/${fil2} |
  samtools view -S -b | samtools sort -o $SNIC_TMP/${sample}_sorted.bam \
  gzip $SNIC_TMP/${sample}_bwa_alignments.bam
}

for file in ${INPUT}/*P1*
do
 run "$file" &
done

wait

cp $SNIC_TMP/*bam.gz $OUTPUT
