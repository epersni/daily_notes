COMMON_TODAY_DATE=$(date +%G-%B-%d)
COMMON_YESTER_DAY=$(date +%G-%B-%d --date="1 days ago")
COMMON_NOTES_EXTENSION=note
COMMON_NOTES_DIR=/home/${USER}/notes/notes

create_symlink_from_file()
{
  local file=$(basename $1)
  local filename="${file%.*}"
  local year=$(echo $(basename $filename) | cut -d'-'  -f 1)
  local month=$(echo $(basename $filename) | cut -d'-'  -f 2)
  local monthn=$(date -d "$month 1" +%m)
  local day=$(echo $(basename $filename) | cut -d'-'  -f 3)
  local week=$(date --date="${month} ${day}" +'%V')
  local weekday=$(date --date="${year}-${monthn}-${day}" +'%A')

  YEAR_DIR=${COMMON_NOTES_DIR}/${year}
  WEEK_DIR=${YEAR_DIR}/weeks/${week}
  MONTHS_DIR=${YEAR_DIR}/months/${month}
  mkdir -p ${MONTHS_DIR} 
  mkdir -p ${WEEK_DIR} 
  ln -fs ${COMMON_NOTES_DIR}/${file} ${WEEK_DIR}/${weekday}
  mkdir -p ${MONTHS_DIR} 
  ln -fs ${COMMON_NOTES_DIR}/${file} ${MONTHS_DIR}/${day}
}

