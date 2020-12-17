<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8"/>

    <xsl:key name="kluczyk" match="Zadanie_1_AK/PojazdyPancerneDrugiejWojnyŚwiatowej/Kraje/Kraj" use="@id" />

        <xsl:template match="@*|node()">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
           
        </xsl:template>

        <xsl:template match="Zadanie_1_AK">
            <xsl:element name="Raport">
                <!-- <xsl:element name="Łączna Waga"> -->
                    <xsl:value-of select="sum(//Waga)"/>
                <!-- </xsl:element> -->

                <!-- <xsl:element name="Największy Kaliber Działa">
                    <xsl:value-of select="max(//@zasięg)" />
                </xsl:element> -->

                <!-- <xsl:element name="okres Produkcji wszystkich modeli">
                    <xsl:value-of select="min(//DataPowstania)" />
                </xsl:element> -->
            </xsl:element>
        </xsl:template>

        <xsl:template match="Pojazd">
            <xsl:copy>
                <xsl:apply-templates select="@numer|@typPojazdu|node()"/>
                
                <xsl:element name="Radio">
                    <xsl:attribute name="zasięg" select="Wyposażenie/Zawieszenie/Radio/@zasięg"/>
                    <xsl:value-of select="Wyposażenie/Zawieszenie/Radio"/>

                </xsl:element>
                
                <xsl:element name="Działo">
                    <xsl:attribute name="kaliber" select="Wyposażenie/Zawieszenie/Wieża/Działo/@kaliber"/>
                    <xsl:value-of select="Wyposażenie/Zawieszenie/Wieża/Działo"/>
                </xsl:element>
                
                <xsl:element name="TypWieży">
                    <xsl:value-of select="Wyposażenie/Zawieszenie/Wieża/TypWieży"/>
                </xsl:element>
                
                <xsl:element name="KrajPochodzenia">
                    <xsl:value-of select="key('kluczyk', @kraj)"/>
                </xsl:element> 
            </xsl:copy>
        </xsl:template>


        <xsl:template match="Tytuł"/>
        <xsl:template match="Kraje"/>
        <xsl:template match="TypyPojazdow"/>
        <xsl:template match="FunkcjeZalogi"/>
        <xsl:template match="Autor"/>
        <xsl:template match="Załoga"/>
        <xsl:template match="Wyposażenie"/>

</xsl:stylesheet>