<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
    <h1>My SMS conversations</h1>
    <table border="1">
      <tr bgcolor="#9acd32">
      <th>Received</th>
      <th>Sent</th>     
    </tr>
    <xsl:for-each select="smses/sms">
    <xsl:sort select="@contact_name"/>
    <xsl:if test="@type=1"> 
      <!-- Handling entry for message that we have received -->
      <tr>
        <td> 
            <xsl:value-of select="@readable_date"/> <br/>
            From: <xsl:value-of select="@contact_name"/><br/>
            <xsl:value-of select="@body"/>
        </td>        
        <td></td>
      </tr>
      
    </xsl:if>
    <xsl:if test="@type=2">
      <!-- Handling entry for message that we have sent -->
      <tr>
        <td></td>
        <td>
          <xsl:value-of select="@readable_date"/><br/>
          To: <xsl:value-of select="@contact_name"/><br/>
          <xsl:value-of select="@body"/></td>        
      </tr>
    </xsl:if>
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

