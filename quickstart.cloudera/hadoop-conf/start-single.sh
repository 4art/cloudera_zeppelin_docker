#! /usr/bin/env bash

DAEMONS="\
    mysqld \
    cloudera-quickstart-init"

if [ -e /var/lib/cloudera-quickstart/.kerberos ]; then
    DAEMONS="${DAEMONS} \
        krb5kdc \
        kadmin"
fi

if [ -e /var/lib/cloudera-quickstart/.cloudera-manager ]; then
    DAEMONS="${DAEMONS} \
        cloudera-scm-server-db \
        cloudera-scb-server \
        cloudera-scm-server-db"
else
    DAEMONS="${DAEMONS} \
        zookeeper-server \
        hadoop-hdfs-datanode \
        hadoop-hdfs-journalnode \
        hadoop-hdfs-namenode \
        hadoop-hdfs-secondarynamenode \
        hadoop-httpfs \
        hadoop-mapreduce-historyserver \
        hadoop-yarn-nodemanager \
        hadoop-yarn-resourcemanager \
        hive-metastore \
        hive-server2"
fi

for daemon in ${DAEMONS}; do
    sudo service ${daemon} stop
done
exec bash
