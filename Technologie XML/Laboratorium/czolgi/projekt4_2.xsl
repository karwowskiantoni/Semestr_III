<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <svg class="zmienialnyKolor" width="2000" height="1200" xmlns="http://www.w3.org/2000/svg">
                <rect class="zmienialnyKolor" x="0" width="2000" y="0" height="1200" fill="#AAAAAA"/>
                
                

                <text x="200" y="55" font-size="50">
                    Liczba Dostępnych Modeli Czołgów Każdego Państwa:
                </text>

                <xsl:for-each select="PojazdyPancerneDrugiejWojnyŚwiatowej/InfoDoWykresu/*">
                    
                    <xsl:variable name="wysokosc" select=". * 90" />
                    <xsl:variable name="pozycjaX" select="position() * 220" />
                    <xsl:variable name="nazwa" select="./name()" />
                    
                    <text x="{$pozycjaX + 60}" y="130" font-size="50">
                        <xsl:value-of select="." />
                    </text>

                    <rect onclick="grease()" class="zmienialnyKolor" x="{$pozycjaX + 50}" width="100" y="200" height="{$wysokosc}" fill="#777777" stroke="black" stroke-width="10">
                        <animate attributeType="XML" attributeName="height" from="0" to="{$wysokosc}"
                                dur="4s" fill="freeze"/>
                        <animate attributeType="XML" attributeName="y" from="600" to="{600 - ($wysokosc)}"
                                dur="4s" fill="freeze"/>
                    </rect>
                    
                    <text class="zmienialnyKolor" writing-mode="tb-lr" x="{$pozycjaX + 45}" y="640" font-size="30" fill="#000000">
                        <xsl:value-of select="$nazwa"/>
                    </text>

                </xsl:for-each>

                <text id="kolory" class="zmienialnyKolor"  x="200" y="1000" font-size="30" fill="#000000">
                    naciśnij enter aby poznać kody wylosowanych kolorów :)
                </text>

                <a href="https://tankionline.com/play/" id="games">    
                    <text x="200" y="900" font-size="30" fill="#000000">
                        naciśnij aby grać w czołgi
                    </text>
                </a>

                <script><![CDATA[ 
                    
                    function getRandomColor() {
                        var tekst = document.getElementById('kolory');
                        var letters = '0123456789ABCDEF';
                        var color = '#';
                        for (var i = 0; i < 6; i++) {
                        color += letters[Math.floor(Math.random() * 16)];
                        }
                        tekst.textContent = tekst.textContent + " " + color;
                        return color;
                    }

                    function grease(){
                        var audio = new Audio('https://voca.ro/1ozcI3iZmqtj');
                        audio.play();
                        audio.volume = 1;
                    }

                    function randomLink(){
                        var games = ["https://tankionline.com/play/", "https://www.gry.pl/gra/tank-fury", "https://worldoftanks.eu/pl/"];
                        var link = document.getElementById("games");
                        link.setAttribute("href", games[Math.floor(Math.random() * 3)]);
                    }
                    
                    document.addEventListener('keydown', function(event) {
                        if(event.keyCode == 13) {
                            var tekst = document.getElementById('kolory');
                            tekst.textContent = "";
    
                            var objectsWithChangableColor = document.getElementsByClassName('zmienialnyKolor');
                            [].forEach.call(objectsWithChangableColor, function (element) {
                                element.setAttribute('fill', getRandomColor());});
                            }
                            randomLink();
                    });

                    ]]>
                </script>
        </svg>
    </xsl:template>
</xsl:stylesheet>