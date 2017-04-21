#!/bin/bash
set -x 
log_loc="/opt/hp/CS300M/utils/hive-testbench-hivehp/results/"

SF=10000
HM="`date +%F`-`date +%H`-`date +%M`"
t=`echo $1 | tr . _`
testname="hdp2.5_${SF}_${t}_${HM}"


/opt/hp/CS300M/utils/bench/dosar.sh start_sar $testname

echo "START $testname: " `date` > $log_loc$testname 

echo "hive -i sample-queries-tpcds/testbench.settings-4g-container-tez --database tpcds_bin_partitioned_orc_$SF -f sample-queries-tpcds/$1" >> $log_loc$testname
hive  -i sample-queries-tpch/testbench.settings-4g-container --database tpch_flat_orc_$SF -f sample-queries-tpch/$1 >> $log_loc$testname 2>& 1
echo "STOP $testname: " `date` >> $log_loc$testname

/opt/hp/CS300M/utils/bench/dosar.sh stop_sar $testname
echo done stop sar
/opt/hp/CS300M/utils/bench/dosar.sh SAR_RESULTS_TPCDS $testname $log_loc$testname 
