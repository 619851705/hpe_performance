#!/bin/bash

QUERY_FILES="/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query*.sql"
SF=$1
RUN=$2
FILETYPE=$3
skip=y
echo "Running LLAP Queries on FILETYPE=$FILETYPE"
  for f in $QUERY_FILES 
   do
    fn=`basename $f`
    if [ "$fn" == "query64.sql" ]
    then
      continue
    fi


    if [ "$fn" == "query82.sql" ]
      then
        skip=n
    fi
    if [ "$skip" == "y" ]
    then
     continue
    fi

    echo "Executing Query: "$fn
   ./spark_run_tpcds_queries.sh $fn $SF $RUN $FILETYPE
 done
  wait
  sleep 5
 echo "Query Execution Completed"
