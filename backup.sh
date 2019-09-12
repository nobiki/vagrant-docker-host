#!/bin/bash

BASE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
OUT_DIR=/d/backup

cat ${BASE_DIR}/backup.lst | while read line
do
    mkdir -p ${OUT_DIR}${line}
    rsync -avz vagrant-docker-host:${line} ${OUT_DIR}${line} > ${OUT_DIR}${line}/backup.log
done


