#!/bin/bash -l

#SBATCH -A uppmax2023-2-3 -M snowy
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 10:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user simon.oscarson.2633@student.uu.se

cat $0
echo USER = $USER
echo QOS = $SLURM_JOB_QOS

# Load modules
module load bioinfo-tools
module load subread
module load AGAT

# Variable
OUT="/home/simonos/Project_genomeanalysis/analysis/htseq"
GFF="/home/simonos/Project_genomeanalysis/analysis/prokka/blast.gff"
IN="/proj/genomeanalysis2023/nobackup/work/simonos/bwa/*.bam"

# Commands
# agat_convert_sp_gff2gtf.pl --gff $GFF -o blast.gtf
gffread $GFF -T 10 -o blast.gtf
featureCounts -a blast.gtf -o $OUT/counts.out -T 10 $IN 
