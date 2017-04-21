#!/bin/bash
set -x 
log_loc="/opt/hp/CS300M/utils/hive-testbench-hivehp/results/hdp2.6/"

SF=$2
RUN=$3
HM="`date +%F`-`date +%H`-`date +%M`"
t=`echo $1 | tr . _`
testname="hdp2.6_llap_run_${RUN}_${SF}_${t}_${HM}"


/opt/hp/CS300M/utils/bench/dosar.sh start_sar $testname

echo "START $testname: " `date` > $log_loc$testname 


echo 'beeline -u "jdbc:hive2://h01mgt.hadoop:2181,h01hn01.hadoop:2181,h01hn02.hadoop:2181/tpcds_bin_partitioned_orc_$SF;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2-hive2" -n hive --incremental=true -i test.settings -f sample-queries-tpcds/$1' >> $log_loc$testname 

beeline -u "jdbc:hive2://h01mgt.hadoop:2181,h01hn01.hadoop:2181,h01hn02.hadoop:2181/tpcds_bin_partitioned_orc_$SF;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2-hive2" -n hive --incremental=true -i settings/test.settings -f sample-queries-tpcds/$1 >> $log_loc$testname 2>& 1

echo "STOP $testname: " `date` >> $log_loc$testname

/opt/hp/CS300M/utils/bench/dosar.sh stop_sar $testname
echo done stop sar
/opt/hp/CS300M/utils/bench/dosar.sh SAR_RESULTS_TPCDS $testname $log_loc$testname 
