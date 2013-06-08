#!/bin/bash

# 
# Export fped footprints to KiCAD
# 
# requires: which, ls, basename, fped (check), printf (check, optional)

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

if ! which printf &> /dev/null
then
   fallbackecho="echo"
   echo "printf not found in your PATH, using fallback"
fi

if [ ! -d kicad ]
then
   mkdir kicad
fi

function indicate {
   if [ "$fallbackecho" == "echo" ]
   then
      echo "${base}.fpd    ->    ${base}.mod"
   else
      printf "%20s.fpd    ->    %s.mod\n" "$base" "$base"
   fi
}

for filename in fped/*.fpd
do
   base=$(basename --suffix=".fpd" $filename)
   fped -k fped/${base}.fpd kicad/${base}.mod
   indicate $base
done
