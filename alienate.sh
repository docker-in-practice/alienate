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
		echo "$f appears to be a Debian package"
		alien $ARGS $f --to-rpm
		alien $ARGS $f --to-slp
		#alien $ARGS $f --to-pkg
		alien $ARGS $f --to-tgz
	elif [[ "$file_type" =~ "RPM" ]]
	then
		echo "$f appears to be an RPM"
		alien $ARGS $f --to-deb
		alien $ARGS $f --to-slp
		#alien $ARGS $f --to-pkg
		alien $ARGS $f --to-tgz
	#elif [[ "$file_type" =~ "bzip2 compressed" ]] && [[ $(echo $f | sed 's/.*\(....\)/\1/') = ".slp" ]]
	#then
	#	echo "$f appears to be a Stampede package"
	#	alien $ARGS $f --to-deb
	#	alien $ARGS $f --to-rpm
	#	alien $ARGS $f --to-pkg
	#	alien $ARGS $f --to-tgz
	#elif [[ "$file_type" =~ "pkg Datastream" ]]
	#then
	#	echo "$f appears to be a Solaris package"
	#	alien $ARGS $f --to-deb
	#	alien $ARGS $f --to-rpm
	#	alien $ARGS $f --to-slp
	#	alien $ARGS $f --to-tgz
	elif [[ "$file type" =~ "gzip compressed data" ]] && [[ $(echo $f | sed 's/.*\(....\)/\1/') = ".tgz" ]]
	then
		echo "assuming $f is a Slackware package"
		alien $ARGS $f --to-deb
		alien $ARGS $f --to-rpm
		alien $ARGS $f --to-slp
		#alien $ARGS $f --to-pkg
	else
		echo "$f not a supported package"
	fi
done

echo "================================================================================="
echo "$D now contains:"
echo "$(ls $D)"
echo "================================================================================="
