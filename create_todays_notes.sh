#!/bin/bash

source common.sh

FILE=${COMMON_NOTES_DIR}/${COMMON_TODAY_DATE}.${COMMON_NOTES_EXTENSION}

if ! [ -d ${COMMON_NOTES_DIR} ]; then
  mkdir -p ${COMMON_NOTES_DIR}
  echo "[] Do stuff" > ${FILE}
  create_symlink_from_file ${FILE}
  echo ${FILE}
  exit
fi

if ! [ -r ${FILE} ]; then
  YESTERDAYS_LEFT_OVER=$(./get_previous_notes.sh)
  
  echo "Previous notes:" > ${FILE}
  echo "===============" >> ${FILE}
  cat ${YESTERDAYS_LEFT_OVER} >> ${FILE}
  
  create_symlink_from_file ${FILE}
fi

echo ${FILE}
