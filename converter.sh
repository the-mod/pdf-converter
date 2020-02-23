#!/bin/bash

#
# Script is walking over PDF Files of the given Directory
# and converts PDFs to txt using pdftotext tool
#

convert() {
   	echo 'Walking over PDFs in:' $DIRECTORY
   	pattern=$DIRECTORY"/*.pdf"

    for file in $pattern;
    do
	    echo "Processing" $file
	    # PDF to txt convertion
	    pdftotext -layout $file
	    echo "Successfully created txt"
	    echo -e "\n"
	done
}

if [ $# -eq 0 ]
  then
    echo "Needed argument -d not supplied"
    exit 1
fi

while getopts d: option
do
	case ${option} in
		d) DIRECTORY=${OPTARG};;
	esac
done

convert $DIRECTORY
