FROM sugdyzhekov/tomcat8:jdk7

MAINTAINER Sergey Zhukov, sergey@jetbrains.com

ENV LOG4J_VER 2.8
ENV LOG4J_BIN apache-log4j-${LOG4J_VER}-bin.tar.gz

RUN wget -O /home/tomcat/${LOG4J_BIN} http://apache-mirror.rbc.ru/pub/apache/logging/log4j/${LOG4J_VER}/${LOG4J_BIN} && \
    cd /home/tomcat/ && tar -xzf ${LOG4J_BIN} && mv apache-log4j-${LOG4J_VER}-bin/log4j-{core,api,jul}-${LOG4J_VER}.jar /home/tomcat/apache-tomcat-current/lib/ && \
    rm -rf apache-log4j-${LOG4J_VER}-bin ${LOG4J_BIN}

ADD tomcat-log4j.xml /home/tomcat/apache-tomcat-current/conf/

# Apply additional transformations to children images
ONBUILD ADD wrapper /home/tomcat/wrapper/
ONBUILD ADD xslt /home/tomcat/xslt/
ONBUILD ADD cacerts /home/tomcat/cacerts/
ONBUILD RUN bash -c ". /apply.sh"

