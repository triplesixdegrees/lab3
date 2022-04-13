#!/bin/bash

save_backup_days=10
now_date_seconds=$(date +%s)
test_date_second=$(($now_date_seconds-$(($save_backup_days*24*60*60))))
backup_dir="/opt/lab3/backups"

cd $backup_dir
for backup in $(ls); do
	# backup
	# 2022-01-01__08-12-00_homes_backup.tar

	# 2022-01-01
	date_str=`echo $backup | awk -F '__' {'print $1'}`

	# 08:12:00
	date_time=`echo $backup | awk -F '__' {'print $2'} | awk -F '_' {'print $1'} | awk -F '-' {'print $1 ":" $2 ":" $3'}`

	date_full="$date_str $date_time"

	date_full_seconds=$(date +%s --date "$date_str $date_time")

	if [ $date_full_seconds -lt $test_date_second ]; then
		rm $backup && echo "DELETED BACKUP: $backup"
	else
		echo "ACTUAL BACKUP: $backup"
	fi
done
cd -

