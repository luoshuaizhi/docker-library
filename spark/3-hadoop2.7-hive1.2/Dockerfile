FROM centos:7.6.1810

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*
    
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/

ENV SPARK_VERSION 3.0.1
ENV SPARK_URL https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7-hive1.2.tgz
RUN curl -fSL "$SPARK_URL" -o /tmp/spark.tgz \
    && tar -xvf /tmp/spark.tgz -C /opt/ \
    && mv /opt/spark-$SPARK_VERSION-bin-hadoop2.7-hive1.2 /opt/spark \
    && ln -s /opt/spark/conf /etc/spark

ENV SPARK_PREFIX=/opt/spark
ENV SPARK_CONF_DIR=/etc/spark

ENV USER=root
ENV PATH $SPARK_PREFIX/bin/:$PATH

# ADD entrypoint.sh /entrypoint.sh
# RUN chmod a+x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]