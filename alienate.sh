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

#ARGS="-v"

for f in $(ls $D)
do
	echo "Examining $f from $(pwd)"
	file_type=$(file -b $f)
	if [[ "$file_type" =~ "Debian binary package" ]]
	then
		alien $ARGS $f --to-rpm
		alien $ARGS $f --to-slp
	elif [[ "$file_type" =~ "RPM" ]]
	then
		alien $ARGS $f --to-deb
		alien $ARGS $f --to-slp
	elif [[ "$file_type" =~ "bzip2 compressed" ]] && [[ $(echo $f | sed 's/.*\(....\)/\1/') = ".slp" ]]
	then
		alien $ARGS $f --to-deb
		alien $ARGS $f --to-rpm
	else
		echo "$f not a recognised package"
	fi
done

echo "================================================================================="
echo "$D now contains:"
echo "$(ls $D)"
echo "================================================================================="
