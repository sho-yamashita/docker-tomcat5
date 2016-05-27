FROM nortthon/java5:latest
MAINTAINER  Lucas Augusto <nortthon@gmail.com>

# Local Tomcat 5.5.26
ADD apache-tomcat-5.5.26.tar.gz /opt
RUN mv /opt/apache-tomcat-5.5.26 /opt/tomcat

ADD start.sh /opt/tomcat/bin/

VOLUME ["/opt/tomcat/webapps"]

ENV JAVA_OPTS '-Xmx1024m -XX:MaxPermSize=512m'
ENV CATALINA_OPTS '-Xmx1024m -XX:MaxPermSize=512m'

ENV CATALINA_HOME /opt/tomcat
ENV CLASSPATH /opt/tomcat/common/lib/jsp-api.jar:/opt/tomcat/common/lib/servlet-api.jar
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080

CMD /opt/tomcat/bin/start.sh
