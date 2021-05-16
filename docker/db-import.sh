#!/bin/bash
 
################################################################
##
##   MySQL Database Backup Script 
##   Written By: Rahul Kumar
##   URL: https://tecadmin.net/bash-script-mysql-database-backup/
##   Last Update: Jan 05, 2019
##
################################################################
 
export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d-%m-%Y"`
 
################################################################
################## Update below values  ########################
 
MYSQL_HOST='drupal-mysql'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='root'
DATABASE_NAME='drupal'
#################################################################
 
echo "Backup started for database - ${DATABASE_NAME}"
gunzip backups/backup.sql.gz -f
 
mysql -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   --execute="create schema if not exists ${DATABASE_NAME}"

mysql -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   ${DATABASE_NAME}  < backups/backup.sql

echo "Removing backup"
rm -rf backups/backup.sql
 
if [ $? -eq 0 ]; then
  echo "Database backup successfully completed"
else
  echo "Error found during backup"
  exit 1
fi
 