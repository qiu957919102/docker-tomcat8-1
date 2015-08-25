<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    
    <!--
        Copies all existing nodes.
    -->
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="Connector[@protocol='AJP/1.3']">
            <xsl:comment><xsl:apply-templates select="." mode="comment"/></xsl:comment>
    </xsl:template>

    <xsl:template match="node()" mode="comment">
        <xsl:choose>
            <xsl:when test="child::node()">
                &lt;<xsl:value-of select="name()"/> <xsl:apply-templates select="@*" mode="#current"/>&gt;
                <xsl:apply-templates select="node()" mode="#current"/>
                &lt;/<xsl:value-of select="name()"/>&gt;
            </xsl:when>
            <xsl:otherwise>
                &lt;<xsl:value-of select="name()"/> <xsl:apply-templates select="@*" mode="#current"/>/&gt;
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="@*" mode="comment" xml:space="preserve"> <xsl:value-of select="name()"/>="<xsl:value-of select="."/>"</xsl:template>
    
                    
    
    <!-- 
        Overrides copying process for Engine with Catalina.
    -->
    
<!--
    <xsl:template match="Engine[@name='Catalina']">
        <Engine>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:copy-of select="doc($insertionDocument)" copy-namespaces="no"/>
        </Engine>
    </xsl:template>
-->    
    <!-- 
        Overrides copying process for any Host under Engine with Catalina.
    -->
<!--    
    <xsl:template match="Host[parent::Engine[@name='Catalina']]">
        <Host appBase="myAppBase">
            <xsl:apply-templates select="@*[name()!=('appBase')]|node()"/>
        </Host>  
    </xsl:template>
-->    
</xsl:stylesheet>