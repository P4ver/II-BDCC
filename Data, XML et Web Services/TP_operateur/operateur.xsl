<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Operateur</title>
            </head>
            <body>
                <ul>
                <xsl:for-each select="operateur/client">
                    
                    <li>Nome du client: <xsl:value-of select="@nom"/> </li>
                    <table border="1">
                        <tr>
                            <td>Num Abonnement</td>
                            <td>Type</td>
                            <td>Date Abonnement</td>
                            <td>Montant total des factures</td>
                        </tr>
                        <xsl:for-each select="abonnement">
                            <tr>
                                <td><xsl:value-of select="@num"/></td>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@dateAb"/></td>
                                <td><xsl:value-of select="sum(facture/@montant)"/></td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr>
                            <td colspan="3">Nombre d'abonnement</td>
                            <td><xsl:value-of select="count(abonnement)"/></td>
                        </tr>

                    </table>
                </xsl:for-each>
                <li>nombre du client : <xsl:value-of select="count(operateur/client)"/></li>
                <li>nombre d'abonnement total : <xsl:value-of select="count(operateur/client/abonnement)"/></li>
                <li>total des facture : <xsl:value-of select="sum(//facture/@montant)"/></li>
                 <li>Total des factures non reglee : <xsl:value-of select="sum(//facture [@reglee='non']/@montant)"/></li>
                </ul>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>