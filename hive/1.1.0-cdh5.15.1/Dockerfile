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

RUN yum install -y hive hive-metastore hive-server2 hive-jdbc hive-hbase mysql-connector-java sentry* \
    && yum clean all -y \
    && rm -rf /var/cache/yum/* \
    && chown -R hdfs:hadoop /etc/hadoop \
    && chown -R hive:hadoop /etc/hive \
    && chmod -R 775 /etc/hadoop /etc/hive

ENV HADOOP_PREFIX /usr/lib/hadoop
ENV HADOOP_HOME $HADOOP_PREFIX
ENV HADOOP_CONF_DIR /etc/hadoop/conf
ENV _HDFS_BIN /usr/bin/hdfs

ENV HIVE_PREFIX /usr/lib/hive
ENV HIVE_HOME $HIVE_PREFIX
ENV HIVE_CONF_DIR=/etc/hive/conf
ENV _HIVE_BIN /usr/bin/hive
ENV _HIVESERVER2_BIN /usr/bin/hiveserver2
RUN ln -sfn /usr/share/java/mysql-connector-java.jar $HIVE_PREFIX/lib/mysql-connector-java.jar

ENV SENTRY_PREFIX /usr/lib/sentry
RUN ln -sfn /usr/share/java/mysql-connector-java.jar $SENTRY_PREFIX/lib/mysql-connector-java.jar
RUN cp $SENTRY_PREFIX/lib/sentry-*.jar $HIVE_PREFIX/lib/
RUN cp $SENTRY_PREFIX/lib/shiro-*.jar $HIVE_PREFIX/lib/

ENV PATH $HADOOP_PREFIX/bin/:$HIVE_PREFIX/bin:$SENTRY_PREFIX/bin:$PATH
WORKDIR $HIVE_PREFIX