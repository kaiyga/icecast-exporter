<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="xml2json.xslt"/>
    <xsl:output indent="no" omit-xml-declaration="yes" method="text" encoding="UTF-8" media-type="application/json"/>
    <xsl:strip-space elements="*"/>

    <xsl:variable name="output">true</xsl:variable>

    <xsl:template match="/icestats">
        {
            <xsl:apply-templates select="*[name() != 'source']" />
            <xsl:if test="count(*[name() != 'source']) > 0 and count(source) >= 0">,</xsl:if>
            "source": [
                <xsl:for-each select="source">
                    <xsl:call-template name="object-content"/>
                    <xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
            ]
        }
    </xsl:template>

    <xsl:template match="icestats/source/max_listeners"><xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if></xsl:template>
    <xsl:template match="icestats/source/public"><xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if></xsl:template>
    <xsl:template match="icestats/source/source_ip"><xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if></xsl:template>
    <xsl:template match="icestats/source/slow_listeners"><xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if></xsl:template>
    <xsl:template match="icestats/source/*[contains(name(), 'total_bytes')]"><xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if></xsl:template>
    <xsl:template match="icestats/source/user_agent" ><xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if></xsl:template>
    <xsl:template match="icestats/source/listener" ><xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if></xsl:template>

    <xsl:template match="icestats/sources | icestats/clients | icestats/stats | icestats/listeners | node()[contains(name(), 'connections')]">
        <xsl:if test="not(following-sibling::*)">"dummy":null</xsl:if>
    </xsl:template>

</xsl:stylesheet>

