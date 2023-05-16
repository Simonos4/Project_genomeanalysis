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
module load samtools

# Variables
IN="/proj/genomeanalysis2023/nobackup/work/simonos/bwa"

# Commands
for file in *.bam
do
 name="${filename%%_*}"  
 samtools flagstat ${file} > ${name}.flag.out
done 
