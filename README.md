Img2folder
==========
Simple script to put files into corresponding Year/Month/Day folder according to exif date of creation

Usage
./img2folder.sh "image_name" "output_folder"

the script will create subfolders if neccesary and will copy image to "output_folder"/Year/Month/Day/"image_name"

If the "image_name" exists a suffix "_count" would be add at the end of the filename.

If exif creating date is missing "image_name" would be put into "output_folder"

To do:

proper handling of images without exif creation date

option to copy/move

option to automaticaly rename files
