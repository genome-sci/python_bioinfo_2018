#$ -S /bin/bash
#$ -pe def_slot 4
#$ -cwd
#$ -t 1-6:1
#$ -l mem_req=8G,s_vmem=8G
#$ -l short

# Batch culture: SRX135198   SRR453566 - SRR453568
# chemostat: SRX135710 SRR453569 - SRR453571
ACESSIONS=(453566 453567 453568 453569 453570 453571)
no=`expr ${SGE_TASK_ID} - 1`

NUM=${ACESSIONS[${no}]}

export PATH=/usr/local/pkg/FastQC/v0.11.8:$PATH
export PATH=/home/yanakamu/tools/Trimmomatic-0.38:$PATH

cd read

java -jar -Xmx512m ~/tools/Trimmomatic-0.38/trimmomatic-0.38.jar \
   PE                     \
   -threads ${NSLOTS}         \
   -phred33               \
   -trimlog log_SRR${NUM}.txt \
   SRR${NUM}_1.fastq.gz  \
   SRR${NUM}_2.fastq.gz  \
   paired_SRR${NUM}_1.trim.fastq.gz   \
   unpaired_SRR${NUM}_1.trim.fastq.gz \
   paired_SRR${NUM}_2.trim.fastq.gz   \
   unpaired_SRR${NUM}_2.trim.fastq.gz \
   ILLUMINACLIP:/home/yanakamu/tools/Trimmomatic-0.38/adapters/TruSeq3-PE-2.fa:2:30:10 \
   LEADING:20 \
   TRAILING:20 \
   SLIDINGWINDOW:4:15 \
   MINLEN:36


fastqc --nogroup -o ./FastQC paired_SRR${NUM}_1.trim.fastq.gz
fastqc --nogroup -o ./FastQC paired_SRR${NUM}_2.trim.fastq.gz
