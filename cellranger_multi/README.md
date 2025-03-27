# Cell Ranger Multi 

There are many different multiplexing methods that 10x supports. The listed options below are the ones CellGenIT has run so far. Check [this page](https://www.10xgenomics.com/support/software/cell-ranger/latest/analysis/running-pipelines/cr-3p-multi) for more information about multiplexing with Cell Ranger, and [this page](https://www.10xgenomics.com/support/software/cell-ranger/latest/analysis/running-pipelines/cr-flex-multi-frp) for multiplexing using Flex kits.  

The key point on running `cellranger multi` is that you need to create config files per sampleID. Check [this page](https://www.10xgenomics.com/support/software/cell-ranger/latest/advanced/cr-multi-config-csv-opts) for the specifics of the config CSV.

## 3' GEX with Cell Multiplexing, multiple CMOs/sample (`cellplex_2`)

<img src="https://cdn.10xgenomics.com/image/upload/v1689282642/software-support/3p-Single-Cell-GEX/Cell-Multiplexing/multi_config_csv_gex_multiple_cmo.png" width="1000">

In this scenario, each sample has multiple CMOs, and the same CMOs can be seen in different samples. In the example run shared in `cellplex_2` folder, sample1 has BC1-3. sample2 and sample3 has BC4-6. Analysing CellPlex data is supported in Cell Ranger 6.0 and later.

Find more information about "Sample Multiplexing with Cell Ranger multi" [here](https://www.10xgenomics.com/support/software/cell-ranger/latest/analysis/running-pipelines/cr-3p-multi).

```
[gene-expression]
reference,/path/to/transcriptome
create-bam,true

[libraries]
fastq_id,fastqs,feature_types
gex1,/path/to/fastqs,Gene Expression
mux1,/path/to/fastqs,Multiplexing Capture

[samples]
sample_id,cmo_ids
sample1,CMO301|CMO302
sample2,CMO303|CMO304
```

* We have separate FASTQs for "Gene Expression" and "Multiplexing Capture" (which includes CMO barcodes).  
* You need to specify the samples in each multiplexed sample. If a sample includes multiple CMO barcodes, they need to be specified and separated by `|`.
* The example in 10x's website uses CMOs from 10x, however in our example, the barcodes used in the samples are custom, so you need to separately specify them in `cmo-set` as seen in the example below and here [feature_ref_feb25.csv](cellranger_multi/cellplex_2/feature_ref_feb25.csv). The patterns and the sequences of the barcodes should be shared with you before running the pipeline:

```
id,name,read,pattern,sequence,feature_type 
BC1,BC1,R2,^(BC),ATCACGTA,Multiplexing Capture
BC2,BC2,R2,^(BC),CGATGTCA,Multiplexing Capture
BC3,BC3,R2,^(BC),TTAGGCGA,Multiplexing Capture
BC4,BC4,R2,^(BC),TGACCAGA,Multiplexing Capture
BC5,BC5,R2,^(BC),ACAGTGCA,Multiplexing Capture
BC6,BC6,R2,^(BC),GCCAATGA,Multiplexing Capture
```


## Multiplex Flex, 1 Probe Barcode/sample (`flex`)

<img src="https://cdn.10xgenomics.com/image/upload/v1728494739/software-support/Fixed-RNA-Profiling/multisample-1probeBC-pool-library-flex.png" width="500">


In this scenario, there are several pools, and each pool consists of multiple samples with the same barcodes shared in different pools. Analysing Flex data is supported in Cell Ranger 7.0 and later.

Find more information about "Flex with Cell Ranger multi" [here](https://www.10xgenomics.com/support/software/cell-ranger/latest/analysis/running-pipelines/cr-flex-multi-frp).


```
[gene-expression]
reference,/path/to/transcriptome
probe-set,/path/to/probe-set.csv  #e.g., cellranger-x.y.z/probe_sets/Chromium_Human_Transcriptome_Probe_Set_v1.0.1_GRCh38-2020-A.csv
create-bam,false #do not generate BAM file

[libraries]
fastq_id,fastqs,feature_types
flex_gex,/path/to/fastqs,Gene Expression

[samples]
sample_id,probe_barcode_ids,description
sample1,BC001,Control
sample2,BC003,Treated
```


* There are no separate FASTQs for the barcodes.  
* The barcode list is not custom this time and specified in the multi config file as `probe-set` using a directory within Cell Ranger location.