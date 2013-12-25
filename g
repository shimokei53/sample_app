#!/bin/sh
#
# ソースコード検索コマンド
#
# see http://www.geocities.co.jp/geo_sunisland/parameter.html
#
# Usage:
#   $ ./g foo
#   $ ./g -d app/action/ foo
#
##############################################################

CMDNAME=`basename $0`
TARGET_DIR=""
DEFAULT_TARGET_DIR="app bin config db features lib public script spec"

# option:
# -d directory
# -h (show help)
while getopts d:h OPT
do
  case $OPT in
    "d" ) FLG_D="TRUE" ; TARGET_DIR="$OPTARG" ;;
    "h" ) echo "Usage: $CMDNAME [-d directoryname] [-h]
-d directoryname: search in the directory
-h :show help
" 1>&2;
  esac
done

# オプション部分を切り捨てる。
shift `expr $OPTIND - 1`

if [ "${TARGET_DIR}" = "" ]; then
    TARGET_DIR=$DEFAULT_TARGET_DIR
fi

if [ ${TERM} = "emacs" ]; then
    COLOR=""
else
    COLOR="--color=always"
fi

# オプション部分が切り捨てられたので、変数 $1 には先頭の引数が設定されている。
find ${TARGET_DIR} -type f  \
! -path '*/.svn/*'  \
! -path '*www/images/*'  \
! -path '*jpg'  \
! -path '*JPG' \
! -path '*gif' \
! -path '*png' \
! -name '*json' \
! -name '*pm' \
! -name '*dat' \
! -name '*exe' \
! -name '*csv' \
! -name '*map' | sort | xargs grep  -n -i -E "$1" $COLOR

exit 0
