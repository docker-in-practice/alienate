#!/bin/bash

D="/io"
cd $D

if [[ "x$1" != "x" ]]
then
	for f in $1
	do
		echo "wgetting $1"
		wget "$1"
	done
fi

for f in $(ls $D)
do
	echo "Examining $f"
	file_type=$(file -b $f)
	if [[ "$file_type" =~ "Debian binary package" ]]
	then
		alien $f --to-rpm --to-slp
	elif [[ "$file_type" =~ "RPM" ]]
	then
		alien $f --to-deb --to-slp
	elif [[ "$file_type" =~ "bzip2 compressed" ]] && [[ $(echo $f | sed 's/.*\(....\)/\1/') = ".slp" ]]
	then
		alien $f --to-deb --to-rpm
	fi
done
