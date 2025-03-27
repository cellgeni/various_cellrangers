#!/bin/bash

TAG=$1 ## sample 

cellranger-8.0.1/cellranger multi --id=$TAG --csv=$TAG.multi.config.csv --localcores=16 --localmem=110
