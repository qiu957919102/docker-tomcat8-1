#!/bin/bash
#
# $1 - dir with configuration files (/home/tomcat/apache-tomcat-current)
#

for xsl in `find -iname *.xsl`
do
    CONFIG=$1/`dirname $xsl`
    echo ${CONFIG}
    /usr/java64/current/bin/java -jar ./saxon9.jar -o ${CONFIG}.new ${CONFIG} ${xsl} && mv ${CONFIG}.new ${CONFIG} && rm ${xsl}

done