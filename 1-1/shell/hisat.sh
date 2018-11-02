#$ -S /bin/bash
#$ -pe def_slot 4
#$ -cwd
#$ -t 1-6:1
#$ -l mem_req=8G,s_vmem=8G
#$ -l short 

pyenv local 2.7.6

export PATH=/usr/local/pkg/hisat2/2.1.0:$PATH
export PATH=/usr/local/pkg/samtools/1.7/bin:$PATH

# Batch culture: SRX135198   SRR453566 - SRR453568
# chemostat: SRX135710 SRR453569 - SRR453571
ACESSIONS=(453566 453567 453568 453569 453570 453571)
no=`expr ${SGE_TASK_ID} - 1`

NUM=${ACESSIONS[${no}]}
PREFIX=SRR${NUM}

echo HISAT2 for $PREFIX

QUERY1=../read/paired_SRR${NUM}_1.trim.fastq.gz
QUERY2=../read/paired_SRR${NUM}_2.trim.fastq.gz

REFERENCE=../reference/hisat/s288c.fna
#REFERENCE=../reference/bowtie/s288c.fna

#cd tophat5
cd hisat
hisat2 -p ${NSLOTS} -x ${REFERENCE} -1 ${QUERY1} -2 ${QUERY2} -S ${PREFIX}.sam
#/usr/local/pkg/tophat2/2.1.1/tophat -o tophat ${REFERENCE} ${QUERY1} ${QUERY2}

samtools view -@ ${NSLOTS} -b ${PREFIX}.sam > ${PREFIX}.bam
samtools sort -@ ${NSLOTS} ${PREFIX}.bam > ${PREFIX}.sorted.bam


