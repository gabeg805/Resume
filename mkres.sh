#!/bin/bash

DIR="./log"
FILE=
PDF=
flag=false

## Determine output directory
if [ -d "$1" ]; then
    DIR="$1"
else
    if [ ! -d "${DIR}" ]; then
        echo "$(basename $0): Directory does not exist."
        exit 1
    fi
    flag=true
fi

## Determine input tex file
if [ "${flag}" == true ]; then
    FILE="$1"
elif [ -f "$2" ]; then
    FILE="$2"
else
    echo "$(basename $0): File does not exist."
    exit 1
fi

## Create pdf
PDF=`echo "${FILE}" | sed 's/\.tex$/\.pdf/'`
pdflatex --output-directory "${DIR}" "${FILE}"
mv "${DIR}/${PDF}" "${PDF}"
