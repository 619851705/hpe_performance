set hive.enforce.bucketing=true;
set hive.enforce.sorting=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions.pernode=100000;
set hive.exec.max.dynamic.partitions=100000;
set hive.exec.max.created.files=1000000;
set hive.exec.parallel=true;
set hive.exec.reducers.max=2000;
set hive.stats.autogather=true;
set hive.optimize.sort.dynamic.partition=true;

set mapred.job.reduce.input.buffer.percent=0.0;
set mapreduce.input.fileinputformat.split.minsizee=240000000;
set mapreduce.input.fileinputformat.split.minsize.per.node=240000000;
set mapreduce.input.fileinputformat.split.minsize.per.rack=240000000;

set mapred.map.child.java.opts=-server -Xmx2800m -Djava.net.preferIPv4Stack=true;
--set mapred.reduce.child.java.opts=-server -Xms1024m -Xmx7800m -Djava.net.preferIPv4Stack=true;
set mapreduce.map.memory.mb=3072;
set mapreduce.reduce.memory.mb=8192;
--set tez.runtime.io.sort.mb=3096;


set tez.container.max.java.heap.fraction=0.8;

set hive.tez.exec.print.summary=true;
set hive.tez.input.format=org.apache.hadoop.hive.ql.io.CombineHiveInputFormat;



set hive.tez.container.size=6144; 
set tez.am.resource.memory.mb=6144;
set tez.task.resource.memory.mb=6144; 
set tez.runtime.io.sort.mb=2458; 
set hive.auto.convert.join.noconditionaltask=true; 
set hive.auto.convert.join.noconditionaltask.size=2126008811; 
set tez.runtime.unordered.output.buffer.size-mb=614; 

set tez.grouping.min-size=1073741824; 
set tez.grouping.max-size=2147483648; 
set hive.exec.parallel.thread.number=16; 
set hive.tez.auto.reducer.parallelism=true; 
set hive.exec.reducers.bytes.per.reducer=1073741824 ; 
set hive.optimize.reducededuplication.min.reducer = 1 ;

set tez.queue.name=default;


set hive.execution.engine=tez;
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;

set hive.vectorized.execution.enabled=true;
set hive.vectorized.execution.reduce.enabled = true;
set hive.vectorized.execution.reduce.groupby.enabled = true;

set mapred.job.reduce.input.buffer.percent=0.0;


set tez.runtime.empty.partitions.info-via-events.enabled=true;
set tez.runtime.report.partition.stats=true;
--set mapred.map.tasks=6;

set hive.limit.pushdown.memory.usage=0.04;
set hive.map.aggr=true;
set hive.mapjoin.bucket.cache.size=10000;
set hive.mapred.reduce.tasks.speculative.execution=false;
set hive.metastore.cache.pinobjtypes=Table,Database,Type,FieldSchema,Order;
set hive.metastore.client.socket.timeout=60;
set hive.metastore.execute.setugi=true;
