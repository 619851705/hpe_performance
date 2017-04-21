fbn=`basename $1`
echo query_number,rows_selected,query_time
grep selected results/hdp2.6/hdp2.6_spark21* | sed "s/.*query\(.\{1,2\}\)_sql_2017-[0-9]\+-[0-9]\+-[0-9]\+-[0-9]\+:\(.*\) rows* selected (\(.*\) seconds)/\1,\2,\3/" $1  | sort -n -k 1.1,1.2
