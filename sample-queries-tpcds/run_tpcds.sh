#!/bin/bash

QUERY_FILES="/opt/hp/CS300M/utils/hive-testbench-hivehp/sample-queries-tpcds/query1*.sql"


echo "Running LLAP Queries"
  for (( f in $QUERY_FILES )
   do
    echo "Executing Query: "$f
  	beeline -u "jdbc:hive2://h01mgt.hadoop:2181,h01hn01.hadoop:2181,h01hn02.hadoop:2181/tpcds_bin_partitioned_orc_100;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2-hive2" -n hive --incremental=true -i test.settings -f $f
  done
  wait
  sleep 5
 echo "Query Execution Completed"
