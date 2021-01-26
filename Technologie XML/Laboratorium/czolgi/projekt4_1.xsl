<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:funkcje="http://whatever">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:variable name="najdłuższyKraj">
        <xsl:for-each select="//KrajPochodzenia">
            <xsl:sort data-type="number" select="string-length()" order="descending"/>
            <xsl:if test="position()=1">
                <xsl:value-of select="."/>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="empty" select="'                                                                        '"/>
    <xsl:variable name="a" select="'|   NAZWA MODELU   '"/>
    <xsl:variable name="b" select="'|   WAGA   '"/>
    <xsl:variable name="c" select="'|   PRĘDKOŚĆ MAKSYMALNA   '"/>
    <xsl:variable name="d" select="'|    DATA POWSTANIA   '"/>
    <xsl:variable name="e" select="'|    TYP WIEŻY   '"/>
    <xsl:variable name="f" select="'|     DZIAŁO   '"/>
    <xsl:variable name="g" select="'|     RADIO     '"/>
    <xsl:variable name="h" select="funkcje:stwórzNagłówek('|KRAJ POCHODZENIA', $najdłuższyKraj)"/>
    <xsl:variable name="y" select="'|-------------------------------------------------------'"/>
    <xsl:variable name="z" select="'|                                                       '"/>

    <xsl:function name="funkcje:stwórzNagłówek">
        <xsl:param name="tytułNagłówka"/>
        <xsl:param name="poleXML"/> 
        <xsl:sequence select="concat( $tytułNagłówka, substring($empty, 1, string-length($poleXML) - string-length($tytułNagłówka) + 1))" />
    </xsl:function>

    <xsl:function name="funkcje:stwórzKomórkę">
        <xsl:param name="argument1"/>
        <xsl:param name="argument2"/>  
        <xsl:param name="argument3"/>
        <xsl:sequence select="substring(concat($argument1, $argument2, $empty), 1, string-length($argument3))"/>
    </xsl:function>

    <xsl:template match="/">
        <xsl:text>|------------------|----------|-------------------------|---------------------|----------------|--------------|---------------|---------------------------------------------|&#xd;&#xa;</xsl:text>    
        <xsl:value-of select="concat($a, $b, $c, $d, $e, $f, $g, $h, '|')"/>
        <xsl:text>&#xd;&#xa;|------------------|----------|-------------------------|---------------------|----------------|--------------|---------------|---------------------------------------------|&#xd;&#xa;</xsl:text>
        <xsl:for-each select="PojazdyPancerneDrugiejWojnyŚwiatowej/Pojazd">
            <xsl:value-of select="funkcje:stwórzKomórkę('|', NazwaModelu, $a)"/>
            <xsl:value-of select="funkcje:stwórzKomórkę('|', Waga, $b)"/>
            <xsl:value-of select="funkcje:stwórzKomórkę('|', PrędkośćMaksymalna, $c)"/>
            <xsl:value-of select="funkcje:stwórzKomórkę('|', DataPowstania, $d)"/>
            <xsl:value-of select="funkcje:stwórzKomórkę('|', TypWieży, $e)"/>
            <xsl:value-of select="funkcje:stwórzKomórkę('|', kaliberDziała, $f)"/>
            <xsl:value-of select="funkcje:stwórzKomórkę('|', Radio, $g)"/>
            <xsl:value-of select="funkcje:stwórzKomórkę('|', KrajPochodzenia, $h)"/>
            <xsl:text>|&#xd;&#xa;</xsl:text>    
        </xsl:for-each>
        <xsl:text>|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$y"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$z"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="funkcje:stwórzKomórkę('| łączna waga: ', /PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Łączna_Waga, $z)"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$z"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="funkcje:stwórzKomórkę('| Największy_Kaliber_Działa: ', /PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Największy_Kaliber_Działa, $z)"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$z"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="funkcje:stwórzKomórkę('| Łączna_Liczba_Członków_Załogi: ', /PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Łączna_Liczba_Członków_Załogi, $z)"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$z"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="funkcje:stwórzKomórkę('| Procentowy_udział_Czołgów_Szybkich: ', /PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Procentowy_udział_Czołgów_Szybkich, $z)"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$z"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="funkcje:stwórzKomórkę('| Data_Wygenerowania: ', /PojazdyPancerneDrugiejWojnyŚwiatowej/Raport/Data_Wygenerowania, $z)"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$z"/><xsl:text>|&#xd;&#xa;</xsl:text>
        <xsl:value-of select="$y"/><xsl:text>|&#xd;&#xa;</xsl:text>
    
    </xsl:template>
</xsl:stylesheet>
