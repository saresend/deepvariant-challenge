set -euo pipefail

## Preliminaries
# Set a number of shell variables, to make what follows easier to read.
BIN_VERSION="0.9.0"

INPUT_DIR="testdata"
REF="hs37d5.fa.gz"
BAM="HG002_NIST_150bp_50x.bam"
TRUTH_VCF="HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz"
TRUTH_BED="HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_noinconsistent.bed"

N_SHARDS="32"

OUTPUT_DIR="output"
OUTPUT_VCF="HG002.output.vcf.gz"
OUTPUT_GVCF="HG002.output.g.vcf.gz"
LOG_DIR="${OUTPUT_DIR}/logs"

## Create local directory structure
mkdir -p "${OUTPUT_DIR}"
mkdir -p "${INPUT_DIR}"


## Download extra packages
# Install aria2 to download data files.
sudo apt-get -qq -y update
sudo apt-get -qq -y install aria2

# Copy the data
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_noinconsistent.bed -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz.tbi -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/HG002_NIST_150bp_50x.bam -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/HG002_NIST_150bp_50x.bam.bai -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/hs37d5.fa.gz -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/hs37d5.fa.gz.fai -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/hs37d5.fa.gz.gzi -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/hs37d5.fa.gzi -d "${INPUT_DIR}"
aria2c -c -x10 -s10 https://storage.googleapis.com/deepvariant/case-study-testdata/hs37d5.fa.fai -d "${INPUT_DIR}"
