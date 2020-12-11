<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xhtml" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Projekt Filmweb</title>
                <link rel="stylesheet" type="text/css" href="style.css" />
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
                            <xsl:for-each select="filmweb/MagazynFilmów/Film">
                                <xsl:sort select="@oskary" data-type="number" order="descending"/>
                                    <tr>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="@oskary >= 5">
                                                    <p class="zloto">
                                                        <xsl:value-of select="@oskary"/>
                                                    </p>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <p>
                                                        <xsl:value-of select="@oskary"/>
                                                    </p>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                             <xsl:value-of select="Info/Tytuł[@origin = 'pl']"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Info/Reżyser/Imię"/>
                                            <p> </p>
                                            <xsl:value-of select="Info/Reżyser/Nazwisko"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="Info/Ocena/Średnia >= 8.50">
                                                    <p>
                                                        <xsl:value-of select="Info/Ocena/Średnia"/>
                                                    </p>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="Info/Ocena/Średnia"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Info/Boxoffice/Całość"/>
                                            <xsl:value-of select="Info/Boxoffice/Całość/@waluta"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="Info/Sukces/@value = 'true'">
                                                    <p class="zielono">
                                                        <xsl:value-of select="Info/Sukces/@value"/>
                                                    </p>
                                                </xsl:when>
                                                <xsl:when test="Info/Sukces/@value = 'false'">
                                                    <p class="czerwono">
                                                        <xsl:value-of select="Info/Sukces/@value"/>
                                                    </p>
                                                </xsl:when>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@gatunek"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Info/Premiera"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Dostępność/@platforma"/>
                                        </td>
                                    </tr>
                            </xsl:for-each>
                    </table>
                </body>
        </html>
    </xsl:template>
</xsl:stylesheet>