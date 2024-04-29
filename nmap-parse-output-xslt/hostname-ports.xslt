<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:npo="http://xmlns.sven.to/npo">
    <npo:comment>
        Extracts a list of all *open* ports in ipaddress:port and hostname:port format.
    </npo:comment>
    <npo:category>extract</npo:category>
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:for-each select="//host">
            <xsl:for-each select="ports/port[state/@state='open']">
                <xsl:variable name="port" select="@portid"/>
                <xsl:for-each select="../../hostnames/hostname">
                    <xsl:value-of select="@name"/>
                    <xsl:text>:</xsl:text>
                    <xsl:value-of select="$port"/>
                    <xsl:text>&#x0a;</xsl:text>
                </xsl:for-each>
                <xsl:value-of select="../../address/@addr"/>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="$port"/>
                <xsl:text>&#x0a;</xsl:text>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
