# Cellranger Scripts

This is a repository containing various Cellranger scripts used for different protocols etc. Each script should use the same submission script with the sample file structured the same way.

### Cellranger FASTQ naming convention
Cellranger expects FASTQ files to be formatted in a particular manner, they should look like `<SAMPLEID>_S*_L00*_R1_001.fastq.gz`.

### Common Practices
* `sample.list` - This is a file with a different sample per line. Each line is tab-separated containing a SAMPLEID followed by an absolute path to directory containing fastqs. The SAMPLEID should be the entire name of the FASTQ files for that sample prior to `_S*_L00*_R1_001.fastq.gz`
* `submit_cellranger.sh` - This is a submission script which submits cellranger to a job on the FARM.

### Submitting Cellranger
Cellranger is submitted from the command line as followed:

`cat sample.list | while read sample fqdir; do /path/to/submit_cellranger.sh /path/to/cellranger_script.sh sample fqdir; done`

### Different versions of cellranger
Each example script here is for a specific version of cellranger (the one used in the request the script was taken from).

If you want a different version replace, check if the version you need is installed inside `/software/cellgeni`, if it is replace `/software/cellgeni/cellranger-version` with you desired version.

If it is not installed reach out to the team in order to get it installed there.
