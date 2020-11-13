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

ENV ZEPPELIN_PREFIX=/opt/zeppelin

ENV USER=root
ENV PATH $ZEPPELIN_PREFIX/bin/:$PATH