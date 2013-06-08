#!/bin/bash

# 
# Clean fped backups
# 
# requires: ls, rm

if [ -d fped ]
then
   if ls fped/*~*.fpd &> /dev/null
   then
      rm -v fped/*~*.fpd
      echo "fped directory cleaned"
   else
      echo "nothing to clean"
   fi
else
   echo "fped directory does not exist"
   exit 1
fi
