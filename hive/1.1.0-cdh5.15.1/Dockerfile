FROM dailynuts/hadoop:2.6.0-cdh5.15.1

RUN yum install -y net-tools curl which java-1.8.0-openjdk-headless \
    && yum clean all -y \
    && rm -rf /var/cache/yum/*
    
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/

ENV HIVE_VERSION 1.1.0-cdh5.15.1
ENV HIVE_URL https://archive.cloudera.com/cdh5/cdh/5/hive-$HIVE_VERSION.tar.gz
RUN curl -fSL "$HIVE_URL" -o /tmp/hive.tar.gz \
    # && curl -fSL "HIVE_URL.asc" -o /tmp/hive.tar.gz.asc \
    # && gpg --verify /tmp/hive.tar.gz.asc \
    && tar -xvf /tmp/hive.tar.gz -C /opt/ \
    && rm /tmp/hive.tar.gz* \
    && mv /opt/hive-$HIVE_VERSION /opt/hive \
    && ln -s /opt/hive/conf /etc/hive \
    && mkdir /opt/hive/logs

ADD mysql-connector-java-5.1.49.jar /opt/hive/lib/

ENV HIVE_PREFIX=/opt/hive
ENV HIVE_CONF_DIR=/etc/hive

ENV USER=root
ENV PATH $HIVE_PREFIX/bin/:$PATH