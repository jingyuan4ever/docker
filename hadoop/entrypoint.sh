#! /bin/bash
# hdfs
service ssh start
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

source $HADOOP_HOME/etc/hadoop/hadoop-env.sh
$HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
alias h="hdfs dfs"

# spark history server
mkdir /tmp/spark-events
$SPARK_HOME/sbin/start-history-server.sh

tail -f /dev/null
