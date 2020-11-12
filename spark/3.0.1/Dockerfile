FROM dailynuts/hadoop:2.6.0-cdh5.15.1

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*
    
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/

ENV SPARK_VERSION 3.0.1
ENV SPARK_URL https://mirror.bit.edu.cn/apache/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz
RUN curl -fSL "$SPARK_URL" -o /tmp/spark.tgz \
    && tar -xvf /tmp/spark.tgz -C /opt/ \
    && mv /opt/spark-$SPARK_VERSION-bin-without-hadoop /opt/spark \
    && ln -s /opt/spark/conf /etc/spark

ENV SPARK_PREFIX=/opt/spark
ENV SPARK_CONF_DIR=/etc/spark

ENV USER=root
ENV PATH $SPARK_PREFIX/bin/:$PATH

# ADD entrypoint.sh /entrypoint.sh
# RUN chmod a+x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]