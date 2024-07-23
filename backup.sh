#!/bin/bash

time_stamp=$(date +"%Y%m%d_%H%M%S") #This is the timestamp which is modified to give full informayiob
backup_dir="/home/ubuntu/day5task/backup" #this is the dir where I want my backup
backup_file="${backup_dir}/backup_${time_stamp}.tar.gz" #this will be the file name for my backup

#Create backup function
function create_backup() {
	tar -czf $backup_file /home/ubuntu/day5task

	if [ $? -eq 0 ]; then
		echo "Backup is successful!"
	else
		echo "Backup is not successful"
	fi
}

create_backup
