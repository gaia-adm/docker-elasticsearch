#!/bin/bash

region="us-west-2"
name="beta"
environ="production"

arr=( $(aws s3 ls s3://gaia.backup-$name-$environ-$region/elastic-backup/indices/ --region $region | grep PRE | tr -s ' ' | cut -d ' ' -f 3 | tr '\n' ' ') )
for index in "${arr[@]}"
  do
    echo Index: $index
    echo $( aws s3 ls s3://gaia.backup-$name-$environ-$region/elastic-backup/indices/$index --region $region --recursive | awk 'BEGIN {total=0}{total+=$3}END{print total/1024/1024" MB"}' )
  done

