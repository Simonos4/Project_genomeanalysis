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
IN="ysk_ref.fasta"
CONTIG="/home/simonos/Genomeanalysis/analysis/assembly/lferriphilum.contigs.fasta"
OUT="/home/simonos/Genomeanalysis/analysis/blast/"

# Commands

blastn -subject $CONTIG \
 -query /home/simonos/Genomeanalysis/code/blast/ysk_ref.fasta \
 -outfmt 6 > $OUT/blast_out.txt



