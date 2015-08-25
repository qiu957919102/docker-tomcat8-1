
s/@app.name@/tomcat/g
s/@app.long.name@/tomcat/g

/^APP_LONG_NAME="tomcat"/ a\
\
export JAVA_HOME=/usr/java64/current\
export CATALINA_HOME=/home/tomcat/apache-tomcat-current\
export CATALINA_BASE=$CATALINA_HOME\
export TMP_DIR=$CATALINA_HOME/temp

/^WRAPPER_CONF=/ a\
WRAPPER_CMD="$CATALINA_HOME/bin/wrapper"\
WRAPPER_CONF="$CATALINA_HOME/conf/wrapper.conf"

/^PIDDIR=/ a\
PIDDIR="$CATALINA_HOME"

/^#RUN_AS_USER/ a\
RUN_AS_USER=tomcat
