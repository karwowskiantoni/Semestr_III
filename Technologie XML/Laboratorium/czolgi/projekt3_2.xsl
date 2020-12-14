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
                    .czerwony{
                        color: red;
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