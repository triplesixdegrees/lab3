#!/bin/bash
backups_dir="/opt/lab3/backups"
backup_dir="/home"
cd $backup_dir
tar -cpf $backups_dir/$(date +%Y-%m-%d__%H-%M-%S)_homes_backup.tar . || exit 42
cd -
exit 0
