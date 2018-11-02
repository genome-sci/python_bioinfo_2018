#$ -S /bin/bash
#$ -pe def_slot 8
#$ -cwd
#$ -l mem_req=8G,s_vmem=8G
#$ -l debug

export PATH=/usr/local/pkg/subread/1.6.2/bin:$PATH

GFF=../reference/s288c_e.gff

mkdir featurecount
cd hisat
featureCounts -T ${NSLOTS} -p -t exon -g gene_id -a $GFF \
  -o ../featurecount/counts.txt \
  SRR453566.sorted.bam \
  SRR453567.sorted.bam \
  SRR453568.sorted.bam \
  SRR453569.sorted.bam \
  SRR453570.sorted.bam \
  SRR453571.sorted.bam

