<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:template name="Root" match="/">
    <html>
      <head>
        <title>Zadanie Krok Po Kroku XPath</title>
        <style>
          body {
            font-family: Times New Roman;
            background-color: black;
          }
          p {
            color: white;
            font-size: 20px;
          }
        </style>
      </head>
      <body>
        <xsl:apply-templates
          name="Zadanie1"
          select="/osoby/grupaStudentow/student[3]"
        />
        <xsl:apply-templates
        name="Zadanie2"
        />
        <xsl:apply-templates
        name="Zadanie3"
        />
        <xsl:apply-templates
        name="Zadanie4"
        />
      </body>
    </html>
  </xsl:template>
  <xsl:template name="Zadanie1" match="/osoby/grupaStudentow/student[3]">
    <p>Zadanie 1<br/>
      1.Ustawić szablon na /osoby/grupaStudentow/student[3].<br/>
      2.Wyświetlić podane grupy elementów/atrybutów z poziomu /osoby/grupaStudentow/student[3] - czyli ścieżki względne z użyciem osi przy definicji ścieżek.<br/>
    </p>
    <p>A. Nazwisko bieżącego elementu:
    <br/>
      <xsl:value-of select="child::nazwisko"/><br/>
    </p> 
    <p>B. Element bieżący student wraz z podelementami:
    <br/>
      <xsl:value-of select="descendant-or-self::*"/> 
    </p>
    <p>C. Element o nazwie grupaPracownikow:
    <br/>
      <xsl:value-of select="ancestor::*/child::grupaPracownikow"/>
    <br/>
    </p>
    <p>D. Punkty studenta o imieniu Stefania:
    <br/>
      <xsl:value-of select="ancestor::*/child::student[imie='Stefania']/descendant::zdobytePunkty"/>
    </p>
    <p>E. NrAlbumu i wiek bieżącego elementu student:
    <br/>
      <xsl:value-of select="child::nrAlbumu"/>
      <xsl:value-of select="child::wiek"/>
    <br/>  
    </p>
    <p>F. Wiek studenta o imieniu Aleksandra
      <br/>
        <xsl:value-of select="ancestor::*/child::student[imie='Aleksandra']/child::wiek"/>
      <br/>  
    </p>
    <p>G. Numery wszystkich pracowników
      <br/>
        <xsl:for-each select="ancestor::*/child::grupaPracownikow/child::pracownik">
          <xsl:value-of select="child::nr_prac"/>
        </xsl:for-each>
      <br/>  
    </p>
    <p>H. Płeć studentów Aleksandra i Teofil oraz wszystkich pracowników:
      <br/>
        -<xsl:value-of select="ancestor::*/child::student[imie='Aleksandra']/attribute::plec"/>
        -<xsl:value-of select="ancestor::*/child::student[imie='Teofil']/attribute::plec"/>
        <xsl:for-each select="ancestor::*/child::grupaPracownikow/child::pracownik">
          -<xsl:value-of select="attribute::plec"/>
        </xsl:for-each>
      <br/>  
    </p>
  </xsl:template>
  <xsl:template name="Zadanie2" match="/">
    <p>Zadanie 2 <br/>
    Korzystając z predykatów oraz operatorów wyświetlić.<br/>
    </p>
    <p>A. Elementy student o wieku powyżej 21 lat:
      <br/>
        <xsl:for-each select="/osoby/grupaStudentow/student[wiek > 21]">
          <xsl:value-of select="."/>
          <br/>
        </xsl:for-each>
    </p>
    <p>B. Wszystkie elementy student, które mają atrybut "plec" o wartości "k":
      <br/>
        <xsl:for-each select="/osoby/grupaStudentow/student[@plec = 'k']">
          <xsl:value-of select="."/>
          <br/>
        </xsl:for-each>
    </p>
    <p>C. Wszystkich pracowników mężczyzn:
      <br/>
      <xsl:for-each select="/osoby/grupaPracownikow/pracownik[@plec = 'm']">
        <xsl:value-of select="."/>
        <br/>
      </xsl:for-each>
    </p> 
    <p>D. Wszystkich pracowników, których numer pracownika jest większy od 40000:
      <br/>
      <xsl:for-each select="/osoby/grupaPracownikow/pracownik[nr_prac > 40000]">
        <xsl:value-of select="."/>
        <br/>
      </xsl:for-each>
    </p> 
  </xsl:template>
  <xsl:template name="Zadanie3" match="/">
    <p>Zadanie 3
    Korzystając z funkcji position() wyświetlić:<br/>
    </p>
    <p>A. Drugie wystąpienie elementu student:
      <br/>
        <xsl:value-of select="/osoby/grupaStudentow/student[position() = 2]"/>
      <br/>
    </p>
    <p>B. Trzecie i kolejne wystąpienie student:
      <br/>
      <xsl:value-of select="/osoby/grupaStudentow/student[position() = 3]"/>
      <xsl:value-of select="/osoby/grupaStudentow/student[position() = 3+1]"/>
      <br/>
    </p>
    <p>C. Wszystkich poza drugim wystąpieniem elementu student:
      <br/>
      <xsl:for-each select="/osoby/grupaStudentow/student[position() != 2]">
        <xsl:value-of select="."/>
      <br/>
      </xsl:for-each>
    </p>
    <p>D. Wszystkie elementy, które są drugim dzieckiem swojego ojca:
      <br/>
      <xsl:for-each select="//child::*[position() = 2]">
        <xsl:value-of select="."/>
        <br/>
      </xsl:for-each>
    </p>
    <p>E. Podostatniego pracownika i studenta:
      <br/>
      <xsl:value-of select="/osoby/grupaStudentow/student[position() = last() - 1]"/>
      <br/>
      <xsl:value-of select="/osoby/grupaPracownikow/pracownik[position() = last() - 1]"/>
      <br/>
    </p>
    <p>F. Od drugiego włącznie pracownika:
      <br/>
      <xsl:for-each select="/osoby/grupaPracownikow/pracownik[position() >= 2]">
          <xsl:value-of select="."/>
      <br/>
      </xsl:for-each>
    </p>
  </xsl:template>

  <xsl:template name="Zadanie4" match="/">
    <p>Zadanie 4
      Korzystając z funkcji XPath wyświetlić: <br/>
    </p>
    <p>A. Wszystkie wartości wiek wykorzystując funkcję text():
      <br/>
      <xsl:for-each select="/osoby/grupaStudentow/student">
        -<xsl:value-of select="wiek/text()"/>
      </xsl:for-each>
      <xsl:for-each select="/osoby/grupaPracownikow/pracownik">
        -<xsl:value-of select="wiek/text()"/>
      </xsl:for-each>
    </p>
    <p>B. Sumę wartości wiek wszystkich pracowników:
      <br/>
      <xsl:value-of select="sum(/osoby/grupaStudentow/student/wiek)"/>
      <br/>
    </p>
    <p>C. Średnią wieku mężczyzn:
      <br/>
      <xsl:value-of select="sum(//*[@plec = 'm']/wiek) div count(//*[@plec = 'm']/wiek)"/>
      <br/>
    </p>
    <p>D. Łańców znaków imię oraz nazwisko rozdzielone spacją np. Teofil Różyc:
      <br/>
        <xsl:value-of select="concat(/osoby/grupaStudentow/student/imie, ' ', /osoby/grupaStudentow/student/nazwisko)"/>
      <br/>
      <xsl:value-of select="concat(/osoby/grupaPracownikow/pracownik/imie, ' ', /osoby/grupaPracownikow/pracownik/nazwisko)"/>
      <br/>
    </p>
    <p>E. Najmłodszego i najstarszego studenta i pracownika:
      <br/>Studenci:<br/>
      <xsl:for-each select="osoby/grupaStudentow/student">
        <xsl:sort select="wiek" data-type="number" order="ascending"/>
          <xsl:if test="position() = 1">
            Najmłodszy: <xsl:value-of select="."/> <br/>
          </xsl:if>
          <xsl:if test="position() = 5">
            Najstarszy: <xsl:value-of select="."/> <br/>
          </xsl:if>
      </xsl:for-each>
      <br/>Pracownicy:<br/>
      <xsl:for-each select="osoby/grupaPracownikow/pracownik">
        <xsl:sort select="wiek" data-type="number" order="ascending"/>
          <xsl:if test="position() = 1">
            Najmłodszy: <xsl:value-of select="."/> <br/>
          </xsl:if>  
          <xsl:if test="position() = 3">
            Najstarszy: <xsl:value-of select="."/> <br/>
          </xsl:if>
      </xsl:for-each>
    </p>
    <p>F. Liczbę kobiet jak i mężczyzn (zarówno studentów jak i pracowników):
      <br/>
      Kobiet jest: <xsl:value-of select="count(//student[@plec = 'k']) + count(//pracownik[@plec = 'k'])"/> <br/>
      Mężczyzn jest: <xsl:value-of select="count(//student[@plec = 'm']) + count(//pracownik[@plec = 'm'])"/> <br/>
    </p>
    <p>G. Liczbę kobiet i mężczyzn dla poszczególnych grup (studentów i osobno dla pracowników):
      <br/>
      Studentek jest: <xsl:value-of select="count(//student[@plec = 'k'])"/> <br/>
      Studentów jest: <xsl:value-of select="count(//student[@plec = 'm'])"/> <br/>
      Pracowniczek jest: <xsl:value-of select="count(//pracownik[@plec = 'k'])"/> <br/>
      Pracowników jest: <xsl:value-of select="count(//pracownik[@plec = 'm'])"/> <br/>
    </p>
    <p>H. Największą i najmniejszą liczbę zdobytych punktów przez studentów
      <!-- Student, który miał potomka "punkty" zamiast "zdobytePunkty"
           nie był liczony w poniższych punktach. Zła nazwa została przyjęta
           jako błąd w dokumencie, który nie zostanie liczony. -->
      <br/>
      <xsl:for-each select="osoby/grupaStudentow/student">
        <xsl:sort select="zdobytePunkty" data-type="number" order="descending"/>
          <xsl:if test="position() = 1">
            Największa ilość punktów zdobytych przez studenta: <xsl:value-of select="zdobytePunkty"/> <br/>
          </xsl:if>
          <xsl:if test="position() = 4">
            Najmniejsza ilość punktów zdobytych przez studenta: <xsl:value-of select="zdobytePunkty"/> <br/>
          </xsl:if>
      </xsl:for-each>
    </p>
    <p>I. Średnią liczbę zdobytych punktów przez studentów
      <br/>
      <xsl:value-of select="sum(//zdobytePunkty) div count(//zdobytePunkty)"/>
    </p>
    <p>J. liczbę studentów, którzy zdali czyli uzyskali powyżej 50 punktów
      <br/>
      <xsl:value-of select="count(//student[zdobytePunkty > 50])"/>
    </p>
  </xsl:template>
</xsl:stylesheet>
