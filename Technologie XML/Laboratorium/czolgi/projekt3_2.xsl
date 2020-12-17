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

                            <xsl:for-each select="Zadanie_1_AK/PojazdyPancerneDrugiejWojnyŚwiatowej/Pojazd">
                            
                            <xsl:sort select="Waga" data-type="number" order="ascending"/>
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
                                        <xsl:value-of select="Działo"/>
                                        (<xsl:value-of select="Działo/@kaliber"/> mm)
                                       
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
                </body>
        </html>
    </xsl:template>

</xsl:stylesheet>