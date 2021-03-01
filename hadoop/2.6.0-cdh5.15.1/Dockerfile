FROM centos:7.6.1810

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless krb5-server krb5-workstation krb5-libs \
    && yum clean all -y \
    && rm -rf /var/cache/yum/* \
    && chmod -R 777 /var/kerberos \
    && chmod -R 777 /etc

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk/

RUN groupadd hadoop
RUN useradd -g hadoop hdfs
RUN useradd -g hadoop yarn
RUN useradd -g hadoop mapred

COPY cdh.repo /etc/yum.repos.d/cdh.repo

RUN yum install -y hadoop hadoop-client hadoop-hdfs-namenode hadoop-hdfs-datanode hadoop-hdfs-journalnode hadoop-httpfs hadoop-yarn-resourcemanager hadoop-yarn-nodemanager hadoop-mapreduce-historyserver hadoop-yarn-proxyserver snappy \
    && yum clean all -y \
    && rm -rf /var/cache/yum/* \
    && chown -R hdfs:hadoop /etc/hadoop \
    && chmod -R 775 /etc/hadoop

ENV HADOOP_PREFIX /usr/lib/hadoop
ENV HADOOP_HOME $HADOOP_PREFIX
ENV HADOOP_CONF_DIR /etc/hadoop/conf
ENV _YARN_BIN /usr/bin/yarn
ENV _HDFS_BIN /usr/bin/hdfs
ENV _MAPRED_BIN /usr/bin/mapred

ENV PATH $HADOOP_PREFIX/bin/:$PATH
WORKDIR $HADOOP_PREFIX