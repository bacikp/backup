#!/bin/bash

BACKUP_DIR="/var/backup_data"

DATABASES=`echo "show databases" | mysql | egrep -v "information_schema|performance_schema|Database"`

for DB in `echo "$DATABASES"`
do
  echo "Starting dump of $DB."
  mysqldump -R "$DB" > "$BACKUP_DIR/$DB.sql"
  echo "Dump of $DB done."
done
