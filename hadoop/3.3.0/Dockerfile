FROM centos:7.6.1810

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk/

RUN groupadd hadoop
RUN useradd -g hadoop hdfs
RUN useradd -g hadoop yarn
RUN useradd -g hadoop mapred

ENV HADOOP_VERSION 3.3.0
ENV HADOOP_URL https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    # && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    # && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /usr/local/ \
    && rm /tmp/hadoop.tar.gz* \
    && mv /usr/local/hadoop-$HADOOP_VERSION /usr/local/hadoop \
    && ln -s /usr/local/hadoop/etc/hadoop /etc/hadoop \
    && chown -R hdfs:hadoop /usr/local/hadoop \
    && chmod -R 775 /usr/local/hadoop \
    && rm -Rf /usr/local/hadoop/share/doc/hadoop

ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_CONF_DIR /etc/hadoop
ENV HADOOP_HOME $HADOOP_PREFIX

WORKDIR $HADOOP_PREFIX

#ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

# ADD entrypoint.sh /entrypoint.sh
# RUN chmod a+x /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

#ENV USER hdfs
ENV _HDFS_BIN $HADOOP_PREFIX/bin/hdfs
ENV _YARN_BIN $HADOOP_PREFIX/bin/yarn
ENV _MAPRED_BIN $HADOOP_PREFIX/bin/mapred