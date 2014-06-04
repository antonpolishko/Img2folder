#!/bin/sh
file=$1
path=$2
Year=$(exiftool -"DateTimeOriginal" $file | cut -d":" -f2 | tr -d ' ')
Month=$(exiftool -"DateTimeOriginal" $file | cut -d":" -f3)
Day=$(exiftool -"DateTimeOriginal" $file | cut -d":" -f4 | cut -d" " -f1)
if [ ! -d "${path}" ];
    then
    echo "Create ${path}"
    mkdir ${path}
fi
if [ ! -d "${path}/${Year}" ];
    then
    echo "Create ${path}/${Year}"
    mkdir ${path}/${Year}
fi
if [ ! -d "${path}/${Year}/${Year}-${Month}" ];
    then
    echo "Create ${path}/${Year}/${Year}-${Month}"
    mkdir ${path}/${Year}/${Month}
fi
if [ ! -d "${path}/${Year}/${Year}-${Month}/${Year}-${Month}-${Day}" ];
    then
    echo "Create ${path}/${Year}/${Year}-${Month}/${Year}-${Month}-${Day}"
    mkdir "${path}/${Year}/${Year}-${Month}/${Year}-${Month}-${Day}"
fi
fileName=$(basename ${file})
count=1
if [ -e ${path}/${Year}/${Year}-${Month}/${Year}-${Month}-${Day}/${fileName} ]
then
    while [ -e ${path}/${Year}/${Year}-${Month}/${Year}-${Month}-${Day}/${fileName}_${count} ]
    do
        echo $count
        let count+=1
    done
    fileName=${fileName}_${count}

fi
#echo "resulting name ${path}/${Year}/${Month}/${Day}/${fileName}"
cp ${file} ${path}/${Year}/${Year}-${Month}/${Year}-${Month}-${Day}/${fileName}
