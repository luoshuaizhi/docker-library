FROM centos:7.6.1810

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*
    
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/

ENV IMPALA_VERSION 2.12.0-cdh5.15.1
# https://archive.cloudera.com/cdh5/redhat/7/x86_64/cdh/cloudera-cdh5.repo
ADD cloudera-cdh5.repo /etc/yum.repos.d/

RUN yum install -y impala impala-server impala-shell impala-catalog impala-state-store \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*

ADD mysql-connector-java-5.1.49.jar /var/lib/impala/

ENV USER=root