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
GFF="/home/simonos/Genomeanalysis/analysis/prokka/blast.gff"
IN="/proj/genomeanalysis2023/nobackup/work/simonos/bwa"

cd $SNIC_TMP


# Function

potato() {
name=$(basename "$f" "_sorted.bam")
#samtools index ${f}
( htseq-count -f bam -r pos -s reverse -t CDS -i ID ${f} $GFF > $OUT/${name}_out_htseq.txt )
}

# Command
for f in ${IN}/*.bam
do
 potato "$f" &
done 

wait
