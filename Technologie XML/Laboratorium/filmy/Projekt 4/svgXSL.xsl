<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <svg width="1200" height="1200" xmlns="http://www.w3.org/2000/svg">
            <a href="https://filmweb.pl/" >
            <image x="650" y="100" width="600" height="600" href="logo.svg" />
            </a>
            <text onclick="mozart()" x="105" y="55" font-family="Comic Sans MS" font-size="32">
               Ilość filmów z bazy danych na danej platformie VOD:
            </text>

            <xsl:for-each select="//FilmowWPlatformie/*">
                <xsl:variable name="ilosc" select=". * 110" />
                <xsl:variable name="numer" select="(position()-1) * 120" />
                <xsl:variable name="nazwa" select="./name()" />
                
                <text x="{$numer + 60}" y="120" font-family="Comic Sans MS" font-size="32">
                    <xsl:value-of select="." />
                </text>

                <rect onclick="changeColour()" class="firstColumn" x="{$numer + 50}" width="50" y="140" height="{$ilosc div 3}" fill="#DC143C" stroke="black" stroke-width="5">
                    <animate attributeType="XML" attributeName="height" from="0" to="{$ilosc div 3}"
                            dur="4s" fill="freeze"/>
                    <animate attributeType="XML" attributeName="y" from="{600}" to="{600 - ($ilosc div 3)}"
                            dur="4s" fill="freeze"/>
                </rect>
                
                <text onclick="szuruburu()" id="dataDoOskarow" x="500" y="800" font-family="Comic Sans MS" font-size="20">
                    Sprawdź ile dni zostało do gali rozdania oskarów
                </text>

                <text id="final" x="500" y="850" font-family="Comic Sans MS" font-size="20"/>

                <text writing-mode="tb-lr" x="{$numer + 45}" y="640" font-family="Comic Sans MS" font-size="20" fill="#000000">
                    <xsl:value-of select="$nazwa"/>
                </text>
            </xsl:for-each>
            
            <script><![CDATA[ 
                function szuruburu(){
                var one_day = 1000 * 60 * 60 * 24 
                var present_date = new Date(); 
                var oscar = new Date(present_date.getFullYear(), 1, 28) 
                if (present_date.getMonth() == 1 && present_date.getdate() > 28) 
                oscar.setFullYear(oscar.getFullYear() + 1) 
                var Result = Math.round(oscar.getTime() - present_date.getTime()) / (one_day); 
                var Final_Result = Result.toFixed(0);
                var data = document.getElementById('final');
                data.textContent = "Do gali rozdania oskarów zostało " + Final_Result + " dni"; 
                }

                function changeColour() {
                    var simplevar = document.getElementsByClassName('firstColumn');
                    [].forEach.call(simplevar, function (element) {
                        element.setAttribute('fill', '#00008B');});
                 }
                function mozart(){
                    var audio = new Audio('https://dorar.at/LARGE/PuretuneMp3/DDTXXuKToo8cm2Y_XbH0Cg/1610460000/201405/189.mp3');
                    audio.play();
                    audio.volume = 0.1;
                }
                ]]>
            </script>
        </svg>
    </xsl:template>
</xsl:stylesheet>