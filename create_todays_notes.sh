#!/bin/bash

source common.sh

NOTES_DIR=notes
if ! [ -d ${NOTES_DIR} ]; then
  mkdir ${NOTES_DIR}
fi
FILE=${NOTES_DIR}/${COMMON_TODAY_DATE}.${COMMON_NOTES_EXTENSION}

if ! [ -r ${FILE} ]; then
  YESTERDAYS_LEFT_OVER=$(./get_previous_notes.sh)
  
  echo "Previous notes:" > ${FILE}
  echo "===============" >> ${FILE}
  cat ${YESTERDAYS_LEFT_OVER} >> ${FILE}
  
  create_symlink_from_file ${FILE}
fi

echo ${FILE}
