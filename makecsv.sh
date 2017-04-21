fbn=`basename $1`
echo query_number,rows_selected,query_time
sed "s/.*query\(.\{1,2\}\)_sql_2017-[0-9]\+-[0-9]\+-[0-9]\+-[0-9]\+:\(.*\) rows* selected (\(.*\) seconds)/\1,\2,\3/" $1 
