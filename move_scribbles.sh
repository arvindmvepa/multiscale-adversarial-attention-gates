#!/bin/bash

target_dir="/home/amvepa91/multiscale-adversarial-attention-gates_arvind/DATA/ACDC"
source_dir="/home/amvepa91/multiscale-adversarial-attention-gates_arvind/DATA/ACDC/acdc_scribbles"

# Loop through all files matching the pattern in the source directory
for file in ${source_dir}/patient*_frame*_scribble.nii.gz; do
   echo $file 
   if [ -f "$file" ]; then
        # Extract the patient number from the filename
        filename=$(basename "$file")
        patient_num=$(echo "$filename" | grep -oP 'patient\K\d+')

        # Create the target subdirectory if it doesn't exist
        mkdir -p "${target_dir}/patient${patient_num}"

        # Copy the file to the target subdirectory
        cp "$file" "${target_dir}/patient${patient_num}/"
        echo "$file" "${target_dir}/patient${patient_num}/"
    fi
done

echo "Files copied successfully."

