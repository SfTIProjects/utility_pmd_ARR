#!/bin/bash -e
#SBATCH --job-name=2bPMBArrayJob             # job name (shows up in the queue)
#SBATCH --output s2b_logs.txt
#SBATCH --open-mode append                # append output into one file
#SBATCH --time=01:00:00                 # Walltime (HH:MM:SS)
#SBATCH --mem=8GB                     # Memory
#SBATCH --array=0-576                     # Array jobs

module load Python/3.9.5-gimkl-2020a


srun python s2b_pmd_cli_ana_app_ARR.py -idx "${SLURM_ARRAY_TASK_ID}" -t 577 -crd ../my_codesnippet_analysis/pmd -ucrd -pd mvn_apps -upd -xrf xmlanalysisreports -uxrf -ef errorcodeanalysis -lf pmd_logs.txt -pxr pmdrules.xml -pef pmd-bin-6.39.0