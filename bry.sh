if [ -z $1 ]
then
  echo 'usage <$0> <direcotry where files are located>'
  exit 1
fi
dname=$1
echo -e query_number rows_selected query_time_run1 query_time_rune2 query_time_run3
grep selected $dname/* | sed "s/.*_\([1-9]\+\)_query\(.\{1,2\}\)_sql_2017-[0-9]\+-[0-9]\+-[0-9]\+-[0-9]\+:\(.*\) rows* selected (\(.*\) seconds)/\1\t\2\t\3\t\4/" | sort -t$'\t' -nk 2.1,2.2  | awk '{q[$2][$1]=$2;r[$2][$1]=$3;t[$2][$1]=$4}END{ for (i in q) {  print q[i][1],"\t",r[i][1],"\t",t[i][1],"\t",t[i][2],"\t",t[i][3]}}' | sort -n
#grep selected /opt/hp/CS300M/utils/hive-testbench-hivehp/results/hdp2.6/spark100gb_parquet_run1/* | sed "s/.*_\([1-9]\+\)_query\(.\{1,2\}\)_sql_2017-[0-9]\+-[0-9]\+-[0-9]\+-[0-9]\+:\(.*\) rows* selected (\(.*\) seconds)/\1\t\2\t\3\t\4/" | sort -t$'\t' -nk 2.1,2.2  | awk '{print $1; print $2; print $3; print $4}'
