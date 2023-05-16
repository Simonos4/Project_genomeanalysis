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
REF="/home/simonos/Genomeanalysis/analysis/assembly/lferriphilum.contigs.fasta"

# Your commands
bwa index $REF -p $SNIC_TMP/ref_index

cp $INPUT/*P1* $SNIC_TMP/
cp $INPUT/*P2* $SNIC_TMP/

cd $SNIC_TMP/

run() {
  sample=$(basename "$file" _P1.trim.fastq.gz)
  echo ${sample} 
  bwa mem ref_index ${sample}_P1.trim.fastq.gz ${sample}_P2.trim.fastq.gz | samtools view -S -b | samtools sort -o ${sample}_sorted.bam 
}

for file in ${INPUT}/*P1*
do
 run "$file" &
 echo ${file} &
done

wait

cp $SNIC_TMP/*.bam /proj/genomeanalysis2023/nobackup/work/simonos/bwa
