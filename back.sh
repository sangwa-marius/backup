#!/bin/bash

<<<<<<< HEAD
read -p "Enter the folder path: " path
path=${path:-$HOME/Documents}

path="${path//\\//}"

if [ ! -d "$path" ]; then
  echo "The folder is invalid"

read -p "Do you want to create $path? [y/n]: " choice

if [ "$choice" = "y" ]; then
  echo "Creating the folder..."
  sleep 2
  mkdir -p "$path"
  echo "Folder created"

else
  echo "The backup has been cancelled"

exit 1
   fi
fi

back="$HOME/backup"
mkdir -p "$back"

date=$(date +%Y)
dir_name=$(basename "$path")_"$date"
echo "Backing up your folder, just a few seconds...."
sleep 2
cp -r "$path" "$back/$dir_name"
echo "Backup saved to $back/$dir_name"
=======
backup_dir="$HOME/backups"

backup(){
read -p "Enter the path of the folder to backup: " path
if [ ! -d "$path" ]; then
  echo "The folder doesn't exist"
  return
fi

date=$(date +%Y%m%d)
dest="$backup_dir/$(basename "$path")_$date"

mkdir -p "$dest"

echo "Backing up your folder..."
sleep 2
cp -r "$path" "$dest"
echo "Backup folder at $dest"
 }


restore(){
echo "Available backups"
ls "$backup_dir"

read -p "Enter the backup folder to restore: " restore

if [ ! -d "$backup_dir/$restore" ]; then
echo "Invalid folder"
return
fi

read -p " Enter the folder path to restore the backup: " folder

if [ ! -d "$folder" ]; then
echo "Creating a restoring folder...."
sleep 2
mkdir -p "$dest_rest"
fi

echo "Restoring...."
sleep 2
cp -r "$backup_dir/$restore" "$folder"
echo "Restored at $folder"

}


echo "======================================"
echo "               🧠                     "
echo "Welcome to a smart Backup &Restore tool"
echo "============Marius script=============="
echo "1. Back up"
echo "2. Restore"

read -p "Choose an option [1/2]" choice

if [ $choice -eq 1 ]; then
sleep 2
backup
elif [ $choice -eq 2 ]; then
sleep 2
restore
else
sleep 3
echo "Invalid choice"
fi


>>>>>>> 0b562e7 (file updated)
