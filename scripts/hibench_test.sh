#!/bin/bash

set_remote_hadoop_home()
{
    HADOOP_HOME=/disk2/user/hadoops/
}
cleanup (){
	ssh user@192.168.122.23 -C $HADOOP_HOME/bin/hdfs dfs -rm -r /HiBench/$1 
}

expunge () {
    ssh user@192.168.122.23 -C $HADOOP_HOME/bin/hdfs dfs -expunge 
}

check_hibench_conf () {
    #hibench.scale.profile
    ssh user@192.168.122.23 -C head -n 10 /disk2/user/HiBench/conf/hibench.conf 
    #hibench.hadoop.home     /disk2/user/hadoops/hadoop-2.7.7
    ssh user@192.168.122.23 -C head -n 10 /disk2/user/HiBench/conf/hadoop.conf 
}



run_remote_workload() {
    vmpid=$1
    bench=$2
    action=$3
    file=${bench}_${action}.perf
    remote_command=$4
    time_log=$5
    
    echo "===== $bench : $action ======"
    perf stat -e intel_cqm/llc_occupancy/ -e intel_cqm/local_bytes/ -e intel_cqm/total_bytes/ -e r00C0 -e r00c4  -e r00c5  -e r4f2e -e r412e -e r003C -e r0108 -e r0185 -p $vmpid -x "," -o $file -I 500 &
    perfprocess=$!
    
    command="/usr/bin/time -f %e,%S,%U,%W,%c,%w -o timeout ssh user@192.168.122.23 -i id_rsa -C bash /disk2/user/HiBench/bin/workloads/$remote_command"
    
    eval $command
    time=`cat timeout` 
    kill -s SIGINT $perfprocess
    bench=$bench
    action=$action
    echo -e "$bench,$action,$time" >> $time_log
    
    echo "Start sleep after $action"
    sleep 10

}


### == end function definitions == ###

vmpid=`ps -elf | grep BUS_2 | grep qemu | tr -s " " | cut -d " " -f 4`
time_log='benchmarks_time.log'
rm $time_log

echo "================="
profile="tiny"
hadoop="hadoop2.7"
echo "VM PID: $vmpid Profile:$profile" 
set_remote_hadoop_home 
echo "Current Hadoop Home is: $HADOOP_HOME"
#check_hibench_conf

run_remote_workload $vmpid "tinysort" "prep" "micro/sort/prepare/prepare.sh" $time_log
run_remote_workload $vmpid "tinysort" "run"     "micro/sort/hadoop/run.sh"      $time_log
cleanup "Sort"

run_remote_workload $vmpid "terasort" "prep" "micro/terasort/prepare/prepare.sh" $time_log
run_remote_workload $vmpid "terasort" "run"  "micro/terasort/hadoop/run.sh"      $time_log
cleanup "Terasort"

run_remote_workload $vmpid "wordcount" "prep" "micro/wordcount/prepare/prepare.sh" $time_log
run_remote_workload $vmpid "wordcount" "run"  "micro/wordcount/hadoop/run.sh"      $time_log
cleanup "Wordcount"

#run_remote_workload $vmpid "sort" "prep" "ml/bayes/prepare/prepare.sh" $time_log
#run_remote_workload $vmpid "sort" "run"  "ml/bayes/hadoop/run.sh"      $time_log
#cleanup "Bayes"

#run_remote_workload $vmpid "sort" "prep" "ml/kmeans/prepare/prepare.sh" $time_log
#run_remote_workload $vmpid "sort" "run"  "ml/kmeans/hadoop/run.sh"      $time_log
#cleanup "Kmeans"

run_remote_workload $vmpid "aggregation" "prep" "sql/aggregation/prepare/prepare.sh" $time_log
run_remote_workload $vmpid "aggregation" "run"  "sql/aggretation/hadoop/run.sh"      $time_log
cleanup "Aggregation"

run_remote_workload $vmpid "join" "prep" "sql/join/prepare/prepare.sh" $time_log
run_remote_workload $vmpid "join" "run"  "sql/join/hadoop/run.sh"      $time_log
cleanup "Join"

run_remote_workload $vmpid "scan" "prep" "sql/scan/prepare/prepare.sh" $time_log
run_remote_workload $vmpid "scan" "run"  "sql/scan/hadoop/run.sh"      $time_log
cleanup "Scan"

expunge


