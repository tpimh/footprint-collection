#!/bin/bash

if [ -d fped ]
then
   if ls fped/*~* &> /dev/null
   then
      rm fped/*~*
      echo "all temp files deleted"
   else
      echo "nothing to clean"
   fi
else
   echo "fped directory does not exist"
   exit 1
fi
