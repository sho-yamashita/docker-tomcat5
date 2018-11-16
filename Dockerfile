FROM java:6-jre

# Local Tomcat 5.5.26
ADD apache-tomcat-5.5.26.tar.gz /opt
RUN mv /opt/apache-tomcat-5.5.26 /usr/local/tomcat

ADD start.sh /usr/local/tomcat/
RUN chmod 755 /usr/local/tomcat/start.sh

ENV JAVA_OPTS '-Xmx1024m -XX:MaxPermSize=512m'
ENV CATALINA_OPTS '-Xmx1024m -XX:MaxPermSize=512m'

ENV CATALINA_HOME /usr/local/tomcat
ENV CLASSPATH /usr/local/tomcat/common/lib/jsp-api.jar:/usr/local/tomcat/common/lib/servlet-api.jar
ENV PATH $PATH:$CATALINA_HOME/bin

VOLUME ["/usr/local/tomcat/webapps","/usr/local/tomcat/conf/Catalina/localhost"]

# install ps command(for confirm java_opts)
RUN apt-get update && apt-get install -y procps

# set timezone
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
ENV JAVA_OPTS="-Duser.timezone=Asia/Tokyo -Duser.language=ja -Duser.country=JP"

# set memory space
ENV JAVA_OPTS=$JAVA_OPTS"-Xms2g -Xmx2g -XX:MaxMetaspaceSize=256m -XX:MetaspaceSize=256m"

# for remote debug 
ENV JPDA_ADDRESS="8000"
ENV JPDA_TRANSPORT="dt_socket"
EXPOSE 8080

CMD /usr/local/tomcat/start.sh
