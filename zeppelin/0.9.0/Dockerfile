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

ENV ANACONDA_URL https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.3.0-Linux-x86_64.sh
#ENV ANACONDA_URL http://10.10.152.1/pub/Anaconda3-5.3.0-Linux-x86_64.sh
RUN curl -fSL "$ANACONDA_URL" -o /tmp/anaconda.sh \
    && bash /tmp/anaconda.sh -b -p /opt/anaconda3

ENV ZEPPELIN_PREFIX=/opt/zeppelin

ENV USER=root
ENV PATH $ZEPPELIN_PREFIX/bin/:$PATH