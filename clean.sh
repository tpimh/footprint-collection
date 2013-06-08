#!/bin/bash

#
# Clean fped backups
#

if [ -d fped ]
then
   if ls fped/*~*.fpd &> /dev/null
   then
      rm fped/*~*.fpd
      echo "all temp files deleted"
   else
      echo "nothing to clean"
   fi
else
   echo "fped directory does not exist"
   exit 1
fi
