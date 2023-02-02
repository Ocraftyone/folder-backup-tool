#Files to backup
backup_location=""
backup_folder=""

#Current Directory
wd=$(pwd)

#Backup file destination
dest=""

#Create backup file name
timestamp=$(date +'%m-%d-%y-%I:%M:%S%p')
fileprefix=""
filename=$fileprefix-$timestamp

#Print start
echo "Backing up $backup_location/$backup_folder to $dest/$filename"
date
echo

#Run backup
cd $backup_location
zip -r $dest/$filename $backup_folder
cd $wd

#Purge old backups
echo Removing old backups
find $dest -name $fileprefix-*.zip -type f -mtime +10 -print -delete

#Print end
echo
echo "Backup finished"
echo
