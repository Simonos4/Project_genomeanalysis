#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J 0101_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# Your commands
canu \
 -p lferriphilum \
 -d /home/simonos/Genomeanalysis/analysis/assembly \
 genomeSize=2.4m \
 useGrid=false \
 maxThreads=4 \
 -pacbio /home/simonos/Genomeanalysis/data/raw_data/DNA_raw_data/*
