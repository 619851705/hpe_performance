#!/bin/bash

QUERY_FILES="/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query*.sql"
SF=$1
RUN=$2

echo "Running LLAP Queries"
  for f in $QUERY_FILES 
   do
    fn=`basename $f`
    if [ "$fn" == "query65.sql" ]
    then
     skip=n
    fi
    if [ "$skip" == "y" ]
    then
     continue
    fi

    echo "Executing Query: "$fn
   ./gatherllapbeeline.sh $fn $SF $RUN
 done
  wait
  sleep 5
 echo "Query Execution Completed"
