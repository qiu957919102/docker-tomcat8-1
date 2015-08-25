<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:log4j="http://jakarta.apache.org/log4j/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" doctype-public="-//log4j//DTD//EN" doctype-system="log4j.dtd"  encoding="UTF-8" indent="yes"/>

    <!--
        Copies all existing nodes.
    -->

   <xsl:template match="/">


        <log4j:configuration>

	  <appender name="lfsError" class="org.apache.log4j.RollingFileAppender">
	    <param name="File" value="${{catalina.base}}/logs/lfs-error.log"/>
	    <param name="MaxFileSize" value="10Mb"/>
	    <param name="MaxBackupIndex" value="20"/>
	    <layout class="org.apache.log4j.PatternLayout">
		<param name="ConversionPattern" value="%d{DATE} %-5p [%-30.30c{1}] %m%n"/>
	    </layout>
	  </appender>

	  <appender name="LFS" class="com.moonlit.logfaces.appenders.AsyncSocketAppender">
            <param name="remoteHost" value="replace-with-real-lfs-servers" />
            <param name="port" value="55200" />
            <param name="locationInfo" value="true" />
            <param name="threshold" value="ALL" />
            <param name="application" value="replace-with-real-app-name" />
            <param name="reconnectionDelay" value="5000" />
            <param name="offerTimeout" value="0" />
            <param name="queueSize" value="100" />
	    <appender-ref ref="lfsError" />
	  </appender>

          <xsl:copy-of select="log4j:configuration/*[name()!='root']"/>
	<root>
	    <xsl:copy-of select="log4j:configuration/root/*"/>
	    <appender-ref ref="LFS"/>
	</root>

        </log4j:configuration>
   </xsl:template>


</xsl:stylesheet>