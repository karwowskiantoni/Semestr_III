<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>    
    <xsl:text>Ilość oskarów     Tytuł filmu                       Reżyser                  Ocena     Boxoffice      Zarobki w I tygodniu   Budżet       Procentowy udział I tygodnia   Premiera              Platforma&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:for-each select="filmweb/Film">
        <xsl:value-of select="substring(concat(Info/Oskary, '                 '), 1, 18)"/>
        <xsl:value-of select="substring(concat(Info/Tytuł, '                             '), 1, 34)"/>
        <xsl:value-of select="substring(concat(Info/Reżyser/Imię, ' ', Info/Reżyser/Nazwisko, '                    '), 1, 25)"/>
        <xsl:value-of select="substring(concat(Info/Ocena/Średnia, '      '), 1, 12)"/>
        <xsl:value-of select="substring(concat(Info/Boxoffice/Całość, '$                 '), 1, 15)"/>
        <xsl:value-of select="substring(concat(Info/Boxoffice/PierwszyTydzień, '$                 '), 1, 23)"/>
        <xsl:value-of select="substring(concat(Info/Boxoffice/Budżet, '$                 '), 1, 13)"/>
        <xsl:value-of select="substring(concat(ProcentowyUdzialPierwszegoTygodnia, '                                   '), 1, 31)"/>
        <xsl:value-of select="substring(concat(Info/Premiera, '                     '), 1, 22)"/>
        <xsl:value-of select="substring(concat(Dostępność/@platforma, ''), 1, 20)"/>
        <xsl:text>&#xd;&#xa;</xsl:text>
    </xsl:for-each>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxx    Raport   xxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>   
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Ilość elementów w dokumencie:      ', /filmweb/Raport/IloscElementow, '                 xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Całkowity koszt wszystkich filmów: ', /filmweb/Raport/CalkowityKosztWszystkichFilmow, '$        xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxx Film o największym przychodzie xxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Tytuł     xxx       ', /filmweb/Raport/FilmONajwiekszymPrzychodzie/Tytul, '   xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Przychód  xxx               ', /filmweb/Raport/FilmONajwiekszymPrzychodzie/Wartosc, '$               xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxx Film o najmniejszym przychodzie xxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Tytuł     xxx        ', /filmweb/Raport/FilmONajmniejszymPrzychodzie/Tytul, '         xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Przychód  xxx                 ', /filmweb/Raport/FilmONajmniejszymPrzychodzie/Wartosc, '$                xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Oskarów/Film  xxx                ', /filmweb/Raport/SredniaIloscOskarow, '                  xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Data wygenerowania  xxx    ', /filmweb/Raport/DataWygenerowania, '           xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxx Podział filmów na platformy VOD xxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Netflix    xxx                      ', /filmweb/Raport/FilmowWPlatformie/Netflix, '                xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx HBO GO     xxx                      ', /filmweb/Raport/FilmowWPlatformie/HBOGO, '                 xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Canal Plus xxx                      ', /filmweb/Raport/FilmowWPlatformie/CanalPlus, '                 xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx Player     xxx                      ', /filmweb/Raport/FilmowWPlatformie/Player, '                 xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>
    <xsl:value-of select="concat('xxx CDA        xxx                      ', /filmweb/Raport/FilmowWPlatformie/CDA, '                xxx')"/><xsl:text>&#xd;&#xa;</xsl:text>
    <xsl:text>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&#xd;&#xa;</xsl:text>

</xsl:template>
</xsl:stylesheet>