FROM google/deepvariant

ARG ref_file=/input/ucsc.hg19.chr20.unittest.fasta
ARG bam_file=/input/NA12878_S1.chr20.10_10p1mb.bam

COPY testdata /input/
COPY output /output/

RUN /opt/deepvariant/bin/run_deepvariant --model_type=WGS --ref=$ref_file --reads=$bam_file --output_vcf=/output/output.vcf.gz --output_gvcf=/output/output.g.fcf.gz --num_shards=4
