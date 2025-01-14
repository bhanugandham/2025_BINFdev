# Author: S Sevilla
# Date: 1/8/25
# Description: Run script which deploys the nextflow workflow

# Input args
profile=$1 
input=$2
outDir=$3
projectID=$4  # Assign projectID from the third argument

# housekeeping; add input condition in the if statement
if [[ -z $outDir || -z $profile || -z $projectID || -z $input ]]; then echo "All variables are required: profile input outDir projectID"; exit; fi
if [[ ! -d $outDir ]]; then mkdir -p $outDir; fi

# run the workflow
nextflow run main.nf \
	-profile $profile \
	--input $input \
	--outdir $outDir \
 	--projectID $projectID \
	-resume
