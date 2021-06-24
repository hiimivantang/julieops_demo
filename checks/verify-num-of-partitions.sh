#!/usr/bin/env bash

FILE=$1
REQUIRED_FACTOR=$2

required=`cat $FILE | grep num.partitions | wc -l`
matches=`cat $FILE | grep num.partitions | grep $REQUIRED_FACTOR | wc -l`

if [ "$matches" -lt "$required" ] ;
then
       echo -e "Some topics have not the minimum num of partitions, please review"
          exit 1
      elif [ "$matches" -ge "$required" ]  ;
      then
             echo -e "All topics have the required minimum num of partitions"
                exit 0
fi
