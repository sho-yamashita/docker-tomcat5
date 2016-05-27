#!/bin/bash
function shutdown()
{
    date
    echo "Shutting down Tomcat"
    unset CATALINA_PID # Necessary in some cases
    unset LD_LIBRARY_PATH # Necessary in some cases
    #unset JAVA_OPTS # Necessary in some cases
    /opt/tomcat/bin/catalina.sh stop
}

date
echo "Starting Tomcat"
echo "JAVA_OPTS=$JAVA_OPTS"
. /opt/tomcat/bin/catalina.sh start

# Allow any signal which would kill a process to stop Tomcat
trap shutdown HUP INT QUIT ABRT KILL ALRM TERM TSTP

tail -f /opt/tomcat/logs/catalina.out
