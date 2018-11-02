#$ -S /bin/bash
#$ -pe def_slot 1
#$ -cwd
#$ -l mem_req=3G,s_vmem=3G

export PATH=/usr/local/pkg/hisat2/2.1.0:$PATH

REFERENCE=./reference/s288c.fna
GFF=./reference/s288c.gff

cd reference
mkdir hisat
hisat2-build s288c.fna ./hisat/s288c.fna

cd ..
mkdir hisat
