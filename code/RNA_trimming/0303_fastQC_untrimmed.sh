#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J 0303_trimmed_RNA_fastQC
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC

# Variables
INPUT="/home/simonos/Genomeanalysis/data/raw_data/RNA_raw_data"
OUTPUT="/home/simonos/Genomeanalysis/analysis/fastQC/fastQC_all_untrimmed/"

# Your commands
fastqc -t 8 -d $OUTPUT -o $OUTPUT $INPUT/*.gz
