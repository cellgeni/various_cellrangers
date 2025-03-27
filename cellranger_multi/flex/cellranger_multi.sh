# BSUB -G cellgeni
# BSUB -q long
# BSUB -n 16
# BSUB -J "tic3719.[1-4]"
# BSUB -M 110G
# BSUB -R "select[mem>110G] rusage[mem=110G]"
# BSUB -o out%J.log
# BSUB -e err%J.log

module load cellgen/cellranger/7.2.0

TAG=$(sed "${LSB_JOBINDEX}q;d" ../actions/samples_multi)

mkdir -p /lustre/scratch127/cellgen/cellgeni/tickets/tic-3719/data/results/$TAG
cellranger multi --id=$TAG --csv=$TAG.multi.config.csv --localcores=16 --localmem=110 --output-dir=/lustre/scratch127/cellgen/cellgeni/tickets/tic-3719/data/results/$TAG
