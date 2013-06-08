#!/bin/bash

# 
# Export fped footprints to KiCAD
# 

if [ ! -d fped ]
then
   echo "fped directory does not exist"
   exit 1
fi

if ! which fped &> /dev/null
then
   echo "fped not found in your PATH, please install fped first"
   exit 1
fi

if ls fped/*~* &> /dev/null
then
   echo "backups found in fped directory, run clean.sh first"
   exit 1
fi

if [ ! -d kicad ]
then
   mkdir kicad
fi

for filename in fped/*.fpd
do
   base=$(basename --suffix=".fpd" $filename)
   fped -k fped/${base}.fpd kicad/${base}.mod
   echo "${base}.fpd -> ${base}.mod"
done
