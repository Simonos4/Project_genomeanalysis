#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J 0102_quality
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

# Variables
INPUT="/home/simonos/Genomeanalysis/analysis/assembly/lferriphilum.contigs.fasta"
OUTPUT="/home/simonos/Genomeanalysis/analysis/quast/"
REF="/home/simonos/Genomeanalysis/data/raw_data/reference/OBMB01.fasta"

# Commands
quast.py $INPUT -R $REF -o $OUTPUT







