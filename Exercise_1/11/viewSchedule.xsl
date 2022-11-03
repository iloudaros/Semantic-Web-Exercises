<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  
  <xsl:template match="/">
    <html>
      <body>
        <h3>The Schedule</h3>
        <table>
          <tr bgcolor="#bb62c8">
            <th>Title</th>
            <th>Professor</th>
            <th>Day</th>
          </tr>
          <xsl:for-each select="Schedule/Lesson">
            
            <xsl:sort select="Lecture/Day='Friday'"/>
            <xsl:sort select="Lecture/Day='Thursday'"/>
            <xsl:sort select="Lecture/Day='Wednesday'"/>
            <xsl:sort select="Lecture/Day='Tuesday'"/>
            <xsl:sort select="Lecture/Day='Monday'"/>
            
            <xsl:choose>
              <xsl:when test="Lecture/Day ='Monday'">
                <tr bgcolor='#ae44be'>
                  <td><xsl:value-of select="Title"/></td>
                  <td><xsl:value-of select="Professor"/></td>
                  <td><xsl:value-of select="Lecture/Day"/></td>
                </tr>
              </xsl:when>
              <xsl:when test="Lecture/Day='Tuesday'">
                <tr bgcolor='#a13fb9'>
                  <td><xsl:value-of select="Title"/></td>
                  <td><xsl:value-of select="Professor"/></td>
                  <td><xsl:value-of select="Lecture/Day"/></td>
                </tr>
              </xsl:when>
              <xsl:when test="Lecture/Day ='Wednesday'">
                <tr bgcolor='#8f39b2'>
                  <td><xsl:value-of select="Title"/></td>
                  <td><xsl:value-of select="Professor"/></td>
                  <td><xsl:value-of select="Lecture/Day"/></td>
                </tr>
              </xsl:when>
              <xsl:when test="Lecture/Day ='Thursday'">
                <tr bgcolor='#7f34aa'>
                  <td><xsl:value-of select="Title"/></td>
                  <td><xsl:value-of select="Professor"/></td>
                  <td><xsl:value-of select="Lecture/Day"/></td>
                </tr>
              </xsl:when>
              <xsl:when test="Lecture/Day ='Friday'">
                <tr bgcolor='#5e2a9e'>
                  <td><xsl:value-of select="Title"/></td>
                  <td><xsl:value-of select="Professor"/></td>
                  <td><xsl:value-of select="Lecture/Day"/></td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
