<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <svg width="1200" height="1200" xmlns="http://www.w3.org/2000/svg">
            <image x="650" y="100" width="600" height="600" href="logo.svg" />
            <text x="105" y="55" font-family="Comic Sans MS" font-size="35">
               Ilość filmów z bazy danych na danej platformie VOD:
            </text>

            <xsl:for-each select="//FilmowWPlatformie/*">
                <xsl:variable name="ilosc" select=". * 110" />
                <xsl:variable name="numer" select="(position()-1) * 120" />
                <xsl:variable name="nazwa" select="./name()" />
                
                <text x="{$numer + 60}" y="120" font-family="Comic Sans MS" font-size="32">
                    <xsl:value-of select="." />
                </text>

                <rect x="{$numer + 50}" width="50" y="140" height="{$ilosc div 3}" fill="#DC143C" stroke="black" stroke-width="5">
                    <animate attributeType="XML" attributeName="height" from="0" to="{$ilosc div 3}"
                            dur="4s" fill="freeze"/>
                    <animate attributeType="XML" attributeName="y" from="{600}" to="{600 - ($ilosc div 3)}"
                            dur="4s" fill="freeze"/>
                </rect>

                <text writing-mode="tb-rl" x="{$numer + 65}" y="640" font-family="Comic Sans MS" font-size="20" fill="#000000">
                    <xsl:value-of select="$nazwa"/>
                </text>
            </xsl:for-each>
            
        </svg>
    </xsl:template>
</xsl:stylesheet>