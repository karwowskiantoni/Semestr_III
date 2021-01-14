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
        <xsl:element name="PojazdyPancerneDrugiejWojnyŚwiatowej">

            <xsl:for-each select="PojazdyPancerneDrugiejWojnyŚwiatowej/Pojazd">
                    <xsl:sort select="@numer" data-type="number" order="descending"/>
                    <xsl:copy>
                        <xsl:apply-templates select="@numer|@typPojazdu|node()"/>
                        
                        <xsl:element name="Radio">
                            <xsl:attribute name="zasięg" select="Wyposażenie/Zawieszenie/Radio/@zasięg"/>
                            <xsl:value-of select="Wyposażenie/Zawieszenie/Radio"/>
                        </xsl:element>
                        
                        <xsl:element name="kaliberDziała">
                            <xsl:attribute name="jednostka" select="Wyposażenie/Zawieszenie/Wieża/Działo/@jednostka"/>
                            <xsl:value-of select="Wyposażenie/Zawieszenie/Wieża/Działo/@kaliber"/>
                        </xsl:element>
                        
                        <xsl:element name="TypWieży">
                            <xsl:value-of select="Wyposażenie/Zawieszenie/Wieża/TypWieży"/>
                        </xsl:element>
                        
                        <xsl:element name="KrajPochodzenia">
                            <xsl:value-of select="key('kluczyk', @kraj)"/>
                        </xsl:element> 
                    </xsl:copy>
                </xsl:for-each>

                <xsl:element name="Raport">
                    <xsl:element name="Łączna_Waga">
                        <xsl:value-of select="sum(//Waga)"/>
                    </xsl:element>

                    <xsl:element name="Największy_Kaliber_Działa">
                        <xsl:value-of select="max(//@zasięg)" />
                    </xsl:element>

                    <xsl:element name="Okres_Produkcji_Wszystkich_Modeli">
                        <xsl:element name="Pierwsza_Data">
                            <xsl:value-of select="min(//DataPowstania)" />
                        </xsl:element>

                        <xsl:element name="Ostatnia_Data">
                            <xsl:value-of select="max(//DataPowstania)" />
                        </xsl:element>
                    </xsl:element>

                    <xsl:element name="Łączna_Liczba_Członków_Załogi">
                            <xsl:value-of select="count(//Członek)" />
                    </xsl:element>

                    <xsl:element name="Procentowy_udział_Czołgów_Szybkich">
                            <xsl:value-of select="format-number((count(//Pojazd[PrędkośćMaksymalna > 40]) div count(//Pojazd)), '0.##%')" />
                    </xsl:element>

                    <xsl:element name="Data_Wygenerowania">
                        <xsl:value-of select="current-date()"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
    </xsl:template>

    <xsl:template match="Tytuł"/>
    <xsl:template match="Kraje"/>
    <xsl:template match="TypyPojazdow"/>
    <xsl:template match="FunkcjeZalogi"/>
    <xsl:template match="Autor"/>
    <xsl:template match="Załoga"/>
    <xsl:template match="Wyposażenie"/>
</xsl:stylesheet>