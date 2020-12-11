<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:key name="klucz" match="/filmweb/Platformy/Platforma" use="@link" />
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="Film">
        <xsl:copy>
            <xsl:apply-templates select="@oskary|@gatunek|node()"/>
            <xsl:element name="Dostępność">
                <xsl:attribute name="platforma" select="key('klucz', Dostępność/@platforma)"/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="Dostępność"/>
    <xsl:template match="Plakat"/>
    <xsl:template match="Platformy"/>
    <xsl:template match="Autor"/>
    <xsl:template match="DataOstatniejModyfikacji"/>
</xsl:stylesheet>