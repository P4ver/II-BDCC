<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Biblio
                </title>
            </head>
            <body>
                <h1>Biblio List</h1>
                <xsl:for-each select="biblio/etudiant">
                    <ul>
                        <li>Code: <xsl:value-of select="@code"/> </li>
                        <li>Nom: <xsl:value-of select="@nom"/> </li>
                        <li>Prenom: <xsl:value-of select="@prenom"/> </li>
                        <li>Age: <xsl:value-of select="@age"/> </li>
                        <li> Nmbre de livre empruntés: <xsl:value-of select="count(livre)"/></li>
                    </ul>
                    
                    <table border="1" width="50%">
                        <tr>
                            <th>ID</th><th>titre</th><th>datePret</th><th>rendu</th>
                        </tr>
                        <xsl:for-each select="livre">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="@titre"/></td>
                                <td><xsl:value-of select="@datePret"/></td>
                                <td><xsl:value-of select="@rendu"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td colspan="3">Nmre de livre rendu</td>
                            <td><xsl:value-of select="count(livre[@rendu='oui'])"/></td>
                        </tr>
                        <tr>
                            <td colspan="3">Nmre de livre non rendu</td>
                            <td><xsl:value-of select="count(livre[@rendu='non'])"/></td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>