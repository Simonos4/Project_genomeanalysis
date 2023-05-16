#!/bin/bash -l

#SBATCH -A uppmax2023-2-3 -M snowy
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 01:00:00
#SBATCH -J blast
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

cat $0
echo USER = $USER
echo QOS = $SLURM_JOB_QOS

# Load modules
module load bioinfo-tools
module load blast

# Variable
CONTIG="/home/simonos/Project_genomeanalysis/analysis/assembly/lferriphilum.contigs.fasta"
OUT="/home/simonos/Project_genomeanalysis/analysis/blast/"

# Commands

blastn -subject $CONTIG \
 -query /home/simonos/Project_genomeanalysis/code/blast/L.ferroxidans_C2-3.fasta \
 -outfmt 6 > $OUT/ferroxidans_blast_out.txt



