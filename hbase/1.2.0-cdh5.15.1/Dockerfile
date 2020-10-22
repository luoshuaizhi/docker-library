FROM dailynuts/hadoop:2.6.0-cdh5.15.1

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*
    
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/

ENV HBASE_VERSION 1.2.0-cdh5.15.1
ENV HBASE_URL https://archive.cloudera.com/cdh5/cdh/5/hbase-$HBASE_VERSION.tar.gz
RUN curl -fSL "$HBASE_URL" -o /tmp/hbase.tar.gz \
    && tar -xvf /tmp/hbase.tar.gz -C /opt/ \
    && rm /tmp/hbase.tar.gz* \
    && mv /opt/hbase-$HBASE_VERSION /opt/hbase \
    && ln -s /opt/hbase/conf /etc/hbase

ENV HBASE_PREFIX=/opt/hbase
ENV HBASE_CONF_DIR=/etc/hbase

ENV USER=root
ENV PATH $HBASE_PREFIX/bin/:$PATH