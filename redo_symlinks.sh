#!/bin/bash

source common.sh

# remove sub directories
cd $COMMON_NOTES_DIR
rm -R -- */ 

for f in ${COMMON_NOTES_DIR}/*.${COMMON_NOTES_EXTENSION}; do
  create_symlink_from_file $f
done

