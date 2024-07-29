#!/bin/bash

function display_usage {
	echo "Usage: $0 <path to the directory whose backup needs to be done>"
}

if [ $# -eq 0 ] || [ ! -d "$1" ]; then
	echo "Please enter a valid argument"
	display_usage
        exit 1
fi 


source_dir=$1

#Create backup function
function create_backup {
        local time_stamp=$(date +"%Y%m%d_%H%M%S") #This is the timestamp which is modified to give full
        local backup_file="${source_dir}/backup_${time_stamp}.tar.gz"

        tar -czf $backup_file $source_dir

        if [ $? -eq 0 ]; then
                echo "Backup created successfully"
        else
                echo "Backup not created"
                exit 1
        fi
}

#Create a function to keep only last 3 backups
function perform_rotation {
	local backups=($(ls -t "${source_dir}/backup_"*))
	
        echo "Current Backups: ${backups[@]}"

	if [ "${#backups[@]}" -gt 3 ]; then
		local backups_to_remove=("${backups[@]:3}")
		
                for backup in "${backups_to_remove[@]}"; do
		    rm -rf "$backup"

		    if [ $? -eq 0 ]; then
			    echo "Removed old backup: $backup"
                    else
                            echo "Failed to remove old backup: $backup"
                    fi
	        done
	fi
}

create_backup
perform_rotation

