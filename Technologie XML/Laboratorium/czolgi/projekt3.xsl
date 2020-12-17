<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Czołgi</title>
                <style>
                    body {
                        background-color: rgb(200, 200, 200);
                        font-size: 15px;
                        color: black;
                    }
                    table {
                        border: 4px ridge rgb(78, 78, 78);
                        gap:3%;
                    }
                    caption { 
                        text-allign: center;
                        font-size: 30px;
                    }
                    th {
                        border: 4px ridge rgb(78, 78, 78);
                    }
            
                    td {
                        border: 4px ridge rgb(78, 78, 78);
                        text-align: center;
                    }
                </style>
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
                                        <xsl:if test="Waga >= 20">
                                        <font color = "red"/>
                                    </xsl:if>
                                        <xsl:value-of select="Waga"/> T
                                    </td>
                                    <td>
                                        <xsl:if test="PrędkośćMaksymalna >= 50">
                                            <font color = "red"/>
                                        </xsl:if>
                                        <xsl:value-of select="PrędkośćMaksymalna"/> km/h

                                    </td>
                                    <td>
                                        <xsl:value-of select="DataPowstania"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Wyposażenie/Zawieszenie/Wieża/TypWieży"/>
                                    </td>
                                    <td>
                                        <xsl:if test="Wyposażenie/Zawieszenie/Wieża/Działo/@kaliber >= 50">
                                            <font color = "red"/>
                                        </xsl:if>
                                        <xsl:value-of select="Wyposażenie/Zawieszenie/Wieża/Działo"/>
                                        (<xsl:value-of select="Wyposażenie/Zawieszenie/Wieża/Działo/@kaliber"/> mm)
                                       
                                    </td>
                                    <td>
                                        <xsl:if test="Wyposażenie/Zawieszenie/Radio/@zasięg >= 400">
                                            <font color = "red"/>
                                        </xsl:if>
                                        <xsl:value-of select="Wyposażenie/Zawieszenie/Radio"/>
                                        (<xsl:value-of select="Wyposażenie/Zawieszenie/Radio/@zasięg"/> m)
                                    </td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="@kraj = 'PL'">
                                                <p>Polska</p>
                                            </xsl:when>
                                            <xsl:when test="@kraj = 'FR'">
                                                <p>Francja</p>
                                            </xsl:when>
                                            <xsl:when test="@kraj = 'IIIR'">
                                                <p>Trzecia Rzesza</p>
                                            </xsl:when>
                                            <xsl:when test="@kraj = 'ZSRR'">
                                                <p>Związek Socjalistycznych Republik Radzieckich</p>
                                            </xsl:when>
                                            <xsl:when test="@kraj = 'USA'">
                                                <p>Stany Zjednoczone Ameryki</p>
                                            </xsl:when>
                                        </xsl:choose>
                                    </td>

                                </tr>
                        </xsl:for-each>
                     
                    </table>
                </body>
        </html>
    </xsl:template>

</xsl:stylesheet>