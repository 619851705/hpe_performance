#!/bin/bash
set -x 
log_loc="/opt/hp/CS300M/utils/hive-testbench-hivehp/results/hdp2.6/"

SF=$2
RUN=$3
FILETYPE=$4
SETTINGS=$5

echo "FT=$FILETYPE"
echo "Settings=$SETTINGS"

HM="`date +%F`-`date +%H`-`date +%M`"
t=`echo $1 | tr . _`

for((i=1;i<=${RUN};i++))
 do 
  
   HM="`date +%F`-`date +%H`-`date +%M`"
   testname="hdp2.6_hivetez_run_${FILETYPE}_${SF}_${i}_${t}_${HM}"
   
   echo "Begin Run ${RUN} times of Query: " $1
   echo "START $testname: " `date` > $log_loc$testname 
   

   echo beeline -u "jdbc:hive2://h01mgt.hadoop:2181,h01hn01.hadoop:2181,h01hn02.hadoop:2181/tpcds_bin_partitioned_${FILETYPE}_${SF};serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2" -n hive --incremental=true -i settings/${SETTINGS}.settings -f sample-queries-tpcds/$1 >> $log_loc$testname
   

   beeline -u "jdbc:hive2://h01mgt.hadoop:2181,h01hn01.hadoop:2181,h01hn02.hadoop:2181/tpcds_bin_partitioned_${FILETYPE}_${SF};serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2" -n hive --incremental=true -i settings/${SETTINGS}.settings -f sample-queries-tpcds/$1 >> $log_loc$testname 2>& 1
    
    echo "STOP $testname: " `date` >> $log_loc$testname

done
