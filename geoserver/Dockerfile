FROM centos:7

# System dependencies
RUN yum install -y curl bzip2 && \
    yum clean all -y

# SQLite Directory Setup
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Version
ENV TOMCAT_VERSION 8.5.45

# Tomcat setup
RUN curl -fSL "http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" -o tomcat.tar.gz \
	&& tar -xz --strip-components=1 -f tomcat.tar.gz \
	&& rm tomcat.tar.gz

# Version
ENV GEOSERVER_VERSION 2.15.2

# MediaWiki setup
RUN curl -fSL "https://jaist.dl.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip" -o geoserver-war.zip \
        && unzip geoserver-war.zip -d webapps/

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
