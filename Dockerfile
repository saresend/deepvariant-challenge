FROM google/deepvariant

COPY testdata /input/
COPY output /output/

RUN /opt/deepvariant/bin/run_deepvariant --model_type=WGS --ref=/input/ucsc.hg19.chr20.unittest.fasta --reads=/input/NA12878_S1.chr20.10_10p1mb.bam --output_vcf=/output/output.vcf.gz --output_gvcf=/output/output.g.fcf.gz --num_shards=4
