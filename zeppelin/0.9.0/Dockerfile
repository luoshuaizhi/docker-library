FROM centos:6.10

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*
    
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0/

ENV ZEPPELIN_VERSION 0.9.0
ENV ZEPPELIN_URL https://mirrors.bfsu.edu.cn/apache/zeppelin/zeppelin-$ZEPPELIN_VERSION-preview2/zeppelin-$ZEPPELIN_VERSION-preview2-bin-all.tgz
RUN curl -fSL "$ZEPPELIN_URL" -o /tmp/zeppelin.tgz \
    && tar -xvf /tmp/zeppelin.tgz -C /opt/ \
    && rm /tmp/zeppelin.tgz \
    && mv /opt/zeppelin-$ZEPPELIN_VERSION-preview2-bin-all /opt/zeppelin

#RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
#    # && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
#    # && gpg --verify /tmp/hadoop.tar.gz.asc \
#    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
#    && rm /tmp/hadoop.tar.gz* \
#    && mv /opt/hadoop-$HADOOP_VERSION /opt/hadoop \
#    && ln -s /opt/hadoop/etc/hadoop /etc/hadoop \
#    # && cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml \
#    && mkdir /opt/hadoop/logs \
#    && mkdir /hadoop-data \
#    && rm -Rf /opt/hadoop/share/doc/hadoop
#
#ENV HADOOP_PREFIX=/opt/hadoop
#ENV HADOOP_CONF_DIR=/etc/hadoop
#ENV MULTIHOMED_NETWORK=1
#
#ENV USER=root
#ENV PATH $HADOOP_PREFIX/bin/:$PATH

# ADD entrypoint.sh /entrypoint.sh
# RUN chmod a+x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]