#$ -S /bin/bash
#$ -pe def_slot 1
#$ -cwd
#$ -l mem_req=4G,s_vmem=4G

export PATH=/usr/local/pkg/FastQC/v0.11.8:$PATH

cd read
mkdir FastQC

# Batch culture: SRX135198   SRR453566 - SRR453568
# chemostat: SRX135710 SRR453569 - SRR453571
ACCESSIONS=`seq 453566 453571`
for NUM in $ACCESSIONS
do
        echo FastQC for SRR${NUM}
        fastqc --nogroup -o ./FastQC SRR${NUM}_1.fastq.gz
        fastqc --nogroup -o ./FastQC SRR${NUM}_2.fastq.gz
done

