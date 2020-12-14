<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
        <title>Projekt Filmweb</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
      </head>
      <body>
        <table>
          <caption>
            Zestaw Danych
          </caption>
          <tr>
            <th>Oskary</th>
            <th>Tytuł</th>
            <th>Reżyser</th>
            <th>Ocena w serwisie</th>
            <th>Zarobione pieniądze</th>
            <th>Procentowy udział pierwszego tygodnia w zarobkach</th>
            <th>Budżet</th>
            <th>Sukces</th>
            <th>Gatunek</th>
            <th>Premiera</th>
            <th>Platforma</th>
          </tr>
          <xsl:for-each select="filmweb/Film">
            <tr>
              <td>
                <xsl:choose>
                  <xsl:when test="Info/Oskary >= 5">
                    <p class="zloto">
                      <xsl:value-of select="Info/Oskary" />
                    </p>
                  </xsl:when>
                  <xsl:otherwise>
                    <p>
                      <xsl:value-of select="Info/Oskary" />
                    </p>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <xsl:value-of select="Info/Tytuł" />
              </td>
              <td>
                <xsl:value-of select="Info/Reżyser/Imię" />
                <p></p>
                <xsl:value-of select="Info/Reżyser/Nazwisko" />
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="Info/Ocena/Średnia >= 8.50">
                    <p class="zloto">
                      <xsl:value-of select="Info/Ocena/Średnia" />
                    </p>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="Info/Ocena/Średnia" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <xsl:value-of select="Info/Boxoffice/Całość" />
                <xsl:value-of select="Info/Boxoffice/Całość/@waluta" />
              </td>
              <td>
                <xsl:value-of select="ProcentowyUdzialPierwszegoTygodnia" />
              </td>
              <td>
                <xsl:value-of select="Info/Boxoffice/Budżet" />
                <xsl:value-of select="Info/Boxoffice/Całość/@waluta" />
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="Info/Sukces/@value = 'true'">
                    <p class="zielono">
                      <xsl:value-of select="Info/Sukces/@value" />
                    </p>
                  </xsl:when>
                  <xsl:when test="Info/Sukces/@value = 'false'">
                    <p class="czerwono">
                      <xsl:value-of select="Info/Sukces/@value" />
                    </p>
                  </xsl:when>
                </xsl:choose>
              </td>
              <td>
                <xsl:value-of select="Info/Gatunek" />
              </td>
              <td>
                <xsl:value-of select="Info/Premiera" />
              </td>
              <td>
                <xsl:value-of select="Dostępność/@platforma" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <div>
          <table>
            <caption>
              Raport
            </caption>
            <tr>
              <th>Ilość wszystkich elementów</th>
              <th>Całkowity koszt wszytkich filmów</th>
              <th>Film o największym przychodzie</th>
              <th>Przychód</th>
              <th>Film o najmniejszym przychodzie</th>
              <th>Przychód</th>
              <th>Średnia ilość oskarów wszystkich elementów</th>
              <th>Data wygenerowania</th>
            </tr>
            <tr>
              <td>
                <xsl:value-of select="filmweb/Raport/IloscElementow" />
              </td>
              <td>
                <xsl:value-of
                  select="filmweb/Raport/CalkowityKosztWszystkichFilmow"
                />
              </td>
              <td>
                <xsl:value-of
                  select="filmweb/Raport/FilmONajwiekszymPrzychodzie/Tytul"
                />
              </td>
              <td>
                <xsl:value-of
                  select="filmweb/Raport/FilmONajwiekszymPrzychodzie/Wartosc"
                />$
              </td>
              <td>
                <xsl:value-of
                  select="filmweb/Raport/FilmONajmniejszymPrzychodzie/Tytul"
                />
              </td>
              <td>
                <xsl:value-of
                  select="filmweb/Raport/FilmONajmniejszymPrzychodzie/Wartosc"
                />$
              </td>
              <td>
                <xsl:value-of select="filmweb/Raport/SredniaIloscOskarow" />
              </td>
              <td>
                <xsl:value-of select="filmweb/Raport/DataWygenerowania" />
              </td>
            </tr>
          </table>
        </div>
        <div>
          <table>
            <caption>
              Tabela ilości filmów o danym gatunku
            </caption>
            <tr>
              <th>Dramat</th>
              <th>Biograficzny</th>
              <th>Komedia</th>
              <th>Gangsterski</th>
              <th>Psychologiczny</th>
              <th>Fantasy</th>
              <th>Kryminał</th>
              <th>Familijny</th>
              <th>Thriller</th>
              <th>Western</th>
              <th>Sci-Fi</th>
            </tr>
            <tr>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Dramat'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Biograficzny'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Komedia'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Gangsterski'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Psychologiczny'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Fantasy'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Kryminał'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Familijny'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Thriller'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Western'])"
                />
              </td>
              <td>
                <xsl:value-of
                  select="count(/filmweb/Film/Info[Gatunek = 'Sci-Fi'])"
                />
              </td>
            </tr>
          </table>
        </div>
        <p>
          <a href="http://validator.w3.org/check?uri=referer"
            ><img
              src="http://www.w3.org/Icons/valid-xhtml10"
              alt="Valid XHTML 1.0 Strict"
              height="31"
              width="88"
          /></a>
        </p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
