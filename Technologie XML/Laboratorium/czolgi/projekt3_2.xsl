<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
    method="xhtml"
    encoding="UTF-8"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    indent="yes"
/>

    <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <link rel="stylesheet" type="text/css" href="projekt3.css" />
                <title>Czołgi</title>
            </head>
                <body>
                    <table>
                        <caption>Czołgi Drugiej Wojny Światowej</caption>
                            <tr>
                                <th>Nazwa Modelu</th>
                                <th>Waga</th>
                                <th>Prędkość Maksymalna</th>
                                <th>Data Powstania</th>
                                <th>Typ Wieży</th>
                                <th>Działo</th>
                                <th>Radio</th>
                                <th>Kraj Pochodzenia</th>
                            </tr>

                            <xsl:for-each select="PojazdyPancerneDrugiejWojnyŚwiatowej/Pojazd">
                            
                                <tr>
                                    <td>
                                        <xsl:value-of select="NazwaModelu"/>
                                    </td>
                                    <td>
                                        <!-- <xsl:when test="Waga >= 20">
                                            <p class="czerwony">
                                                <xsl:value-of select="Waga"/>
                                            </p>
                                        </xsl:when> -->
                                        <xsl:value-of select="Waga"/> T
                                    </td>
                                    <td>
                                        <xsl:value-of select="PrędkośćMaksymalna"/> km/h

                                    </td>
                                    <td>
                                        <xsl:value-of select="DataPowstania"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="TypWieży"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="kaliberDziała"/>
                                        (<xsl:value-of select="kaliberDziała/@jednostka"/> mm)
                                       
                                    </td>
                                    <td>
                                        <xsl:value-of select="Radio"/>
                                        (<xsl:value-of select="Radio/@zasięg"/> m)
                                    </td>
                                    <td>
                                        <xsl:value-of select="KrajPochodzenia"/>
                                    </td>

                                </tr>
                        </xsl:for-each>
                     
                    </table>

                    <table>
                        <caption>Raport</caption>
                        <tr>
                            <th>Łączna_Waga</th>
                            <th>Największy_Kaliber_Działa</th>
                            <th>Pierwsza_Data</th>
                            <th>Ostatnia_Data</th>
                            <th>Łączna_Liczba_Członków_Załogi</th>
                            <th>Procentowy_udział_Czołgów_Szybkich</th>
                            <th>Data_Wygenerowania</th>
                        </tr>                            
                        <tr>
                            <td>
                                <xsl:value-of select="PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Łączna_Waga"/>
                            </td>
                            <td>
                                <xsl:value-of select="PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Największy_Kaliber_Działa"/>
                            </td>
                            <td>
                                <xsl:value-of select="PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Okres_Produkcji_Wszystkich_Modeli/Pierwsza_Data"/>
                            </td>
                            <td>
                                <xsl:value-of select="PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Okres_Produkcji_Wszystkich_Modeli/Ostatnia_Data"/>
                            </td>
                            <td>
                                <xsl:value-of select="PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Łączna_Liczba_Członków_Załogi"/>
                            </td>
                            <td>
                                <xsl:value-of select="PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Procentowy_udział_Czołgów_Szybkich"/>
                            </td>
                            <td>
                                <xsl:value-of select="PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Data_Wygenerowania"/>
                            </td>
                        </tr>
                    </table>
                    <p>
                        <a href="http://validator.w3.org/check?uri=referer"><img
                          src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a>
                    </p>
                </body>
        </html>
    </xsl:template>

</xsl:stylesheet>