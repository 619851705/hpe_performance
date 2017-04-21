#fbn=`basename $1`
DS=$1
echo "data set size selected=$DS"
echo query_number,rows_selected,query_time
grep selected results/hdp2.6/spark5tb_run2/hdp2.6_spark21* | sed "s/.*query\(.\{1,2\}\)_sql_2017-[0-9]\+-[0-9]\+-[0-9]\+-[0-9]\+:\(.*\) rows* selected (\(.*\) seconds)/\1,\2,\3/" $1  | sort -n -k 1.1,1.2
