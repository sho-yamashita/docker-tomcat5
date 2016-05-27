# Docker Tomcat 5.5.26

## Docker Run
    docker run \
      --name tomcat5 \
      -p 8080:8080 \
      -v /your/local/apps:/opt/tomcat/webapps \
      -v /your/catalina/localhost:/opt/tomcat/conf/Catalina/localhost \
      nortthon/tomcat5
