#!/bin/bash

QUERY_FILES="/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query*.sql"

#QUERY_FILES=("/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query17.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query39.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query46.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query49.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query50.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query64.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query70.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query72.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query75.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query76.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query80.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query82.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query84.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query85.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query87.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query88.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query90.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query93.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query94.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query95.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query96.sql")


#QUERY_FILES=("/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query75.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query76.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query80.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query82.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query84.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query85.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query87.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query88.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query90.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query93.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query94.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query95.sql" "/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query96.sql")

SF=$1
RUN=$2
FILETYPE=$3
SETTINGS=$4
skip=y
echo "Running LLAP Queries"
#  for f in $QUERY_FILES

  for f in ${QUERY_FILES[@]}
   do
    fn=`basename $f`
    #if [ "$fn" == "query75.sql" ]
    #  then
    #    skip=n
    #fi
    #if [ "$skip" == "y" ]
    #then
    # continue
    #fi

    echo "Executing Query: "$fn
   ./hivetez_run_tpcds_queries.sh $fn $SF $RUN $FILETYPE $SETTINGS
 done
  wait
  sleep 5
 echo "Query Execution Completed"
