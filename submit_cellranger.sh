#!/bin/bash

set -euo pipefail

SCRIPT=`readlink -f ${1:?"Please provide script"}`
TAG=${2:?"Please provide sample tag"}
FQDIR=${3:?"Please provide fastq directory"}

GROUP="cellgeni"
CPU=16
MEM=128000
Q="normal"
WDIR=`pwd`

bsub \
  -n $CPU \
  -M $MEM \
  -R"span[hosts=1] select[mem>${MEM}] rusage[mem=${MEM}]" \
  -G $GROUP \
  -q $Q \
  -o $WDIR/$TAG.%J.bsub.log \
  -e $WDIR/$TAG.%J.bsub.err \
  $SCRIPT $TAG $FQDIR
