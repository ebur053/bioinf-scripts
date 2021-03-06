#!/bin/bash -e

# This script was developed by Manpreet Dhami (Manaaki Whenua Landcare Research) and Ben Roberts (NeSI NZ)

###########################
# Setup SLURM Environment #
###########################

#SBATCH --account YOUR_PROJECT_NAME
#SBATCH --job-name faststructure
#SBATCH --cpus-per-task 8
#SBATCH --time 30:00
#SBATCH --mem-per-cpu=3G
#SBATCH --output faststructure-%j.out
#SBATCH --error faststructure-%j.err
#SBATCH --nodes=1 #default

# Set directory paths (assuming you used the setup_workshop.sh to setup your workspace)
workingdir="$HOME/fastStructure_workshop"
vcfdir="${workingdir}/data"
scripts="${workingdir}/scripts"


module load Python/3.6.3-gimkl-2017a
module load fastStructure/1.0-gimkl-2017a-Python-2.7.14

for prior in simple logistic
	do
	for K in 1 2 3 4 5 6 7 8 9 10
		do
			
		structure.py \
			-K $K \
			--input=${vcfdir}/final_strains \
			--output=${vcfdir}/${prior}/final_strains \
			--tol=0.00001 \
			--prior=$prior \
			--cv=0 \
			--format=bed \
			--full
			
		done
	done
