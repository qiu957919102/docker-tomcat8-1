#!/bin/bash

# Apply additional transformations for configs
cd /home/tomcat/wrapper/ && . ./1-apply.sh /home/tomcat/apache-tomcat-current && \
cd /home/tomcat/xslt/ && . ./1-apply.sh /home/tomcat/apache-tomcat-current && \
cd /home/tomcat/cacerts/ && . ./1-apply.sh /home/tomcat/apache-tomcat-current/conf/truststore
