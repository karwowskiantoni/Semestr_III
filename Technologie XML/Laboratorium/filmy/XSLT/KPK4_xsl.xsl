<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Projekt Filmweb</title>
                <style>
                    body {
                        background-color: black;
                        font-size: 20px;
                        font-family: Times New Roman;
                        color: pink;
                    }
                    table {
                        border: 10px ridge red;
                        border-collapse: collapse;
                    }
                    caption { 
                        font-family: Impact;
                        padding 100px
                        text-allign: center;
                        font-size: 30px 
                    }
                    th {
                        border: 5px ridge gold;
                    }
            
                    td {
                        text-align: center;
                        border: 4px ridge gold;
                    }
                </style>
            </head>
                <body>
                    <table>
                        <caption>Kolekcja Oskarów</caption>
                            <tr>
                                <th>Oskary</th>
                                <th>Tytuły</th>
                                <th>Rezyser</th>
                                <th>Ocena</th>
                                <th>Boxoffice</th>
                                <th>Sukces</th>
                                <th>Gatunek</th>
                                <th>Premiera</th>
                                <th>Platforma</th>
                            </tr>
                            <xsl:for-each select="filmweb/MagazynFilmow/Film">
                                <xsl:sort select="@oskary" data-type="number" order="descending"/>
                                    <tr>
                                        <td>
                                            <xsl:if test="@oskary >= 5">
                                            <font color = "gold"/>
                                            </xsl:if>
                                            <xsl:value-of select="@oskary"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Info/Tytul"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Info/Rezyser/Imie"/>
                                            <p> </p>
                                            <xsl:value-of select="Info/Rezyser/Nazwisko"/>
                                        </td>
                                        <td>
                                            <xsl:if test="Info/Ocena/Srednia >= 8.50">
                                            <font color = "gold"/>
                                            </xsl:if>
                                            <xsl:value-of select="Info/Ocena/Srednia"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Info/Boxoffice/Calosc"/>
                                            <xsl:value-of select="Info/Boxoffice/Calosc/@waluta"/>
                                        </td>
                                        <td>
                                            <xsl:if test="Info/Sukces/@value = 'true'">
                                            <font color = "green"/>
                                            </xsl:if>
                                            <xsl:if test="Info/Sukces/@value = 'false'">
                                            <font color = "red"/>
                                            </xsl:if>
                                            <xsl:value-of select="Info/Sukces/@value"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="@gatunek = '&amp;g1;'">
                                                    <p>Dramat</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g2;'">
                                                    <p>Biograficzny</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g3;'">
                                                    <p>Komedia</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g4;'">
                                                    <p>Gangsterski</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g5;'">
                                                    <p>Psychologiczny</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g6;'">
                                                    <p>Fantasy</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g7;'">
                                                    <p>Kryminał</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g8;'">
                                                    <p>Familijny</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g9;'">
                                                    <p>Thriller</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g10;'">
                                                    <p>Western</p>
                                                </xsl:when>
                                                <xsl:when test="@gatunek = '&amp;g11;'">
                                                    <p>Sci-Fi</p>
                                                </xsl:when>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Info/Premiera"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="Dostepnosc/@platforma = 'net'">
                                                    <p>Netflix</p>
                                                </xsl:when>
                                                <xsl:when test="Dostepnosc/@platforma = 'hbo'">
                                                    <p>HBO GO</p>
                                                </xsl:when>
                                                <xsl:when test="Dostepnosc/@platforma = 'cp'">
                                                    <p>Canal Plus</p>
                                                </xsl:when>
                                                <xsl:when test="Dostepnosc/@platforma = 'cda'">
                                                    <p>CDA</p>
                                                </xsl:when>
                                                <xsl:when test="Dostepnosc/@platforma = 'play'">
                                                    <p>Player</p>
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