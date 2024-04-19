#!/bin/bash

set -euo pipefail

TAG=$1 ## sample 
FQDIR=$2

REF=/software/cellgen/cellgeni/refdata-gex-GRCh38-2020-A

/software/cellgen/cellgeni/cellranger-6.0.2/cellranger count \
  --id=$TAG \
  --fastqs=$FQDIR \
  --transcriptome=$REF \
  --sample=$TAG \
  --localcores=16 --localmem=110
