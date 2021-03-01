FROM centos:7.6.1810

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless krb5-server krb5-workstation krb5-libs \
    && yum clean all -y \
    && rm -rf /var/cache/yum/* \
    && chmod -R 777 /var/kerberos \
    && chmod -R 777 /etc

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk/

RUN groupadd hadoop
RUN useradd -g hadoop hive
RUN useradd -g hadoop hdfs

COPY cdh.repo /etc/yum.repos.d/cdh.repo

RUN yum install -y hive hive-metastore hive-server2 hive-jdbc hive-hbase mysql-connector-java \
    && yum clean all -y \
    && rm -rf /var/cache/yum/* \
    && chown -R hdfs:hadoop /etc/hadoop \
    && chown -R hive:hadoop /etc/hive \
    && chmod -R 775 /etc/hadoop /etc/hive

ENV HADOOP_PREFIX /usr/lib/hadoop
ENV HADOOP_HOME $HADOOP_PREFIX
ENV HADOOP_CONF_DIR /etc/hadoop/conf

ENV HIVE_PREFIX /usr/lib/hive
ENV HIVE_HOME $HIVE_PREFIX
ENV HIVE_CONF_DIR=/etc/hive/conf

ENV PATH $HADOOP_PREFIX/bin/:$HIVE_PREFIX/bin:$PATH
WORKDIR $HIVE_PREFIX