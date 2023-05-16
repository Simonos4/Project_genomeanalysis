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
module load samtools
module load htseq

# Variable
OUT="/home/simonos/Genomeanalysis/analysis/htseq"
GFF="/home/simonos/Genomeanalysis/analysis/prokka/Leptospirillum.gff"
IN="/proj/genomeanalysis2023/nobackup/work/simonos/bwa"

cd $SNIC_TMP

# Command
for f in ${IN}/*bam.gz
do
 name=$(basename "$f" "_sorted.bam.gz")
 gunzip ${f} > out.bam
 samtools view -h out.bam > out.sam 
 ( htseq-count -f bam -r pos -s reverse -t CDS out.sam $GFF > $OUT/${name}_out_htseq.txt ) &
done 

wait
