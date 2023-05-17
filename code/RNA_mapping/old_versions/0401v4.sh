#!/bin/bash -l

#SBATCH -A uppmax2023-2-3 -M snowy
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 10:00:00
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

run() {
  filename=${file%%_*}
  bwa mem ref_index $INPUT/${filename}_P1.trim.fastq.gz $INPUT/${filename}_P2.trim.fastq.gz \
  > $SNIC_TMP/${filename}_bwa_alignments.sam \ 
  samtools sort -o $SNIC_TMP/${filename}_bwa_alignments.sam $SNIC_TMP/${filename}_mapped_sorted.bam \
  gzip $SNIC_TMP/${filename}_mapped_sorted.bam 

}

for file in ${INPUT}/*P1*
do
 run "$file" &
done

wait

cp $SNIC_TMP/*bam.gz $OUTPUT

