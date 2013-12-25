#!/bin/sh

TARGET_DIRS="app bin config db features lib public script spec"

find ${TARGET_DIRS} $@ \
! -path ‘*/.git*’    \
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
! -name '*map' \
| grep $1 -i
