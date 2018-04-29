#!/bin/bash

#Folders to backup definition
FOLDERS="
/etc
/home
/root
/var/www
/var/vmail
/var/backup_data
"
TIME=`date +"%Y-%m-%d_%H-%M-%S"`

BACKUP_DIR="/mnt/backup"

echo "Starting backup $TIME."

echo "Starting MySQL DB dump."
/root/backup_mysql.sh
echo "MySQL DB dump ended."

mkdir -p ${BACKUP_DIR}/${TIME}
for FOLDER in `echo $FOLDERS`
do
  REM_SLASH=`echo "$FOLDER" | cut -d "/" -f2- | tr "/" "_"`
  echo "Start tar backup of $FOLDER."
  tar zcf "${BACKUP_DIR}/${TIME}/${REM_SLASH}.tar.gz" "${FOLDER}"
  echo "tar backup of $FOLDER ended."
done

echo "Backup $TIME ended."
