#!/bin/bash

set -euo pipefail

TAG=$1 ## sample 
FQDIR=$2

REF=/nfs/srpipe_references/downloaded_from_10X/refdata-cellranger-vdj-GRCh38-alts-ensembl-7.0.0

/software/cellgen/cellgeni/cellranger-7.0.1/cellranger vdj \
  --id=$TAG \
  --fastqs=$FQDIR \
  --reference=$REF \
  --sample=$TAG \
  --localcores=16 --localmem=110
