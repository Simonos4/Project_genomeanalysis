#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J 0201_prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka/1.45-5b58020

# Variables
INPUT="/home/simonos/Genomeanalysis/analysis/assembly/lferriphilum.contigs.fasta"
OUTPUT="/home/simonos/Genomeanalysis/analysis/prokka/"

# Commands
prokka --outdir $OUTPUT \
 --addgenes \
 --genus Leptospirillum \
 --species ferriphilum \
 --gram neg \
 --usegenus \
 --prefix Leptospirillum \
 $INPUT
 

