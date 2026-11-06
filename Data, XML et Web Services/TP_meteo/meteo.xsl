<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé Météorologique</title>
            </head>
            
            <body>
                <h1>Relevé Météorologique</h1>
                
                <xsl:for-each select="meteo/mesure">
                    
                    <h2>
                        Date :
                        <xsl:value-of select="@date"/>
                    </h2>
                    
                    <table border="1">
                        <tr>
                            <th>Ville</th>
                            <th>Température (°C)</th>
                        </tr>
                        
                        <xsl:for-each select="ville">
                            <tr>
                                <td>
                                    <xsl:value-of select="@nom"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@temperature"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr>
                            <td>Nombre de villes</td>
                            <td>
                                <xsl:value-of select="count(ville)"/>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>Total des températures</td>
                            <td>
                                <xsl:value-of select="sum(ville/@temperature)"/>
                            </td>
                        </tr>
                        
                    </table>
                    
                </xsl:for-each>
                
                <h2>Résumé général</h2>
                
                <p>
                    Nombre de mesures :
                    <xsl:value-of select="count(meteo/mesure)"/>
                </p>
                
                <p>
                    Nombre total de villes mesurées :
                    <xsl:value-of select="count(//ville)"/>
                </p>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>