<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8"/>
    <xsl:key name="klucz" match="/filmweb/Platformy/Platforma" use="@link"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="MagazynFilmów">

        <xsl:for-each select="Film">
            <xsl:sort select="@oskary" data-type="number" order="descending"/>
                <xsl:copy>
                    <xsl:apply-templates select="node()"/>
                    <xsl:element name="ProcentowyUdzialPierwszegoTygodnia">
                        <xsl:value-of select="format-number((Info/Boxoffice/PierwszyTydzień div Info/Boxoffice/Całość), '0.##%')"/>
                    </xsl:element>
                    <xsl:element name="Dostępność">
                        <xsl:attribute name="platforma" select="key('klucz', Dostępność/@platforma)"/>
                    </xsl:element>
                </xsl:copy>
        </xsl:for-each>

        <xsl:element name="Raport">
            <xsl:element name="IloscElementow">
                <xsl:value-of select="count(Film)"/>
            </xsl:element> 

            <xsl:element name="CalkowityKosztWszystkichFilmow">
                <xsl:value-of select="format-number(sum(//Boxoffice/Budżet), '#')"/>
            </xsl:element>

            <xsl:element name="FilmONajwiekszymPrzychodzie">
                <xsl:element name="Tytul">
                <xsl:value-of select="//Film/Info[Boxoffice/Całość = $maxPrzychod]/Tytuł[@origin = 'pl']"/>
                </xsl:element>
                <xsl:element name="Wartosc">
                    <xsl:value-of select="format-number($maxPrzychod, '#')"/>
                </xsl:element>
            </xsl:element>

            <xsl:element name="FilmONajmniejszymPrzychodzie">
                <xsl:element name="Tytul">
                    <xsl:value-of select="//Film/Info[Boxoffice/Całość = $minPrzychod]/Tytuł[@origin = 'pl']"/>
                </xsl:element>
                <xsl:element name="Wartosc">
                    <xsl:value-of select="format-number($minPrzychod, '#')"/>
                </xsl:element>
            </xsl:element>

            <xsl:element name="SredniaIloscOskarow">
                <xsl:value-of select="round(avg(//Film/@oskary), 1)"/>
            </xsl:element>
            
            <xsl:element name="FilmowWPlatformie">
                <xsl:element name="Netflix">
                    <xsl:value-of select="count(//Film/Dostępność[@platforma = 'net'])"/>
                </xsl:element>
                <xsl:element name="HBOGO">
                    <xsl:value-of select="count(//Film/Dostępność[@platforma = 'hbo'])"/>
                </xsl:element>
                <xsl:element name="CanalPlus">
                    <xsl:value-of select="count(//Film/Dostępność[@platforma = 'cp'])"/>
                </xsl:element>
                <xsl:element name="Player">
                    <xsl:value-of select="count(//Film/Dostępność[@platforma = 'play'])"/>
                </xsl:element>
                <xsl:element name="CDA">
                    <xsl:value-of select="count(//Film/Dostępność[@platforma = 'cda'])"/>
                </xsl:element>
            </xsl:element>

            <xsl:element name="DataWygenerowania">
                <xsl:value-of select="current-date()"/>
            </xsl:element>
        </xsl:element> 

    </xsl:template>

    <xsl:template match="Info">
        <xsl:copy>
            <xsl:element name="Oskary">
                <xsl:value-of select="../@oskary"/>
            </xsl:element>
            <xsl:element name="Gatunek">
                <xsl:value-of select="../@gatunek"/>
            </xsl:element>
            <xsl:apply-templates select="node()"/> 
        </xsl:copy>
    </xsl:template>

    <xsl:variable name="maxPrzychod" select="max(//Boxoffice/Całość)"/>
    <xsl:variable name="minPrzychod" select="min(//Boxoffice/Całość)"/>

    <xsl:template match="Początek"/>
    <xsl:template match="Dostępność"/>
    <xsl:template match="Plakat"/>
    <xsl:template match="Platformy"/>
    <xsl:template match="Autor"/>
    <xsl:template match="DataOstatniejModyfikacji"/>
    <xsl:template match="Tytuł[@origin = 'org']"/>
    <xsl:template match="Ocena/Głosów"/>
</xsl:stylesheet>