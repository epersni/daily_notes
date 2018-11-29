#!/bin/bash

source common.sh

d=${COMMON_TODAY_DATE}
prev_file=${COMMON_NOTES_DIR}/${d}.${COMMON_NOTES_EXTENSION}

counter=1 
while ! [ -r $prev_file ]; do 
	d=$(date +%G-%B-%d --date="${counter} days ago")
	prev_file=${COMMON_NOTES_DIR}/${d}.${COMMON_NOTES_EXTENSION}
  counter=$((counter + 1))
done

echo $prev_file

