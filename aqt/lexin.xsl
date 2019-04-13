<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <div class="lemma">
      <b>
        <xsl:value-of select="Lemma/@Value" />
      </b>

      <xsl:if test="Lemma/Phonetic">
        <xsl:text> </xsl:text>
        <a>
          <xsl:attribute name="href">http://lexin.nada.kth.se/sound/<xsl:value-of select="Lemma/Phonetic/@File" /></xsl:attribute>
          <small><xsl:value-of select="Lemma/Phonetic" /></small>
        </a>
      </xsl:if>
      <xsl:text> </xsl:text>
      <xsl:value-of select="Lemma/@Type" />
      <xsl:if test="Lemma/Reference">
        <xsl:text> </xsl:text>
        <small><xsl:value-of select="Lemma/Reference/@Type"/></small>
        <xsl:text> </xsl:text>
        <b>
          <xsl:value-of select="Lemma/Reference/@Value"/>
        </b>
      </xsl:if>

      <xsl:if test="Lemma/Inflection">
        <br/>
        (<xsl:for-each select="Lemma/Inflection">
        <xsl:value-of select="text()" />
        <xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>)
      </xsl:if>
      <ul>
        <xsl:for-each select="Lemma/Lexeme">
          <li>
            <xsl:if test="Definition and Comment">
              <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
            </xsl:if>
            <xsl:value-of select="Comment"/>
            <xsl:if test="Definition and Comment">
              <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
            </xsl:if>
            <xsl:value-of select="Definition"/>
            <xsl:choose>
              <xsl:when test="Compound">
              <br />Compounds:
              <ul>
                <xsl:for-each select="Compound">
                  <li>
                    <xsl:value-of select="text()" />
                  </li>
                </xsl:for-each>
              </ul></xsl:when>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="Example">
              <br />Examples:
              <ul>
                <xsl:for-each select="Example">
                  <li>
                    <xsl:value-of select="text()" />
                  </li>
                </xsl:for-each>
              </ul></xsl:when>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="Graminfo">
              <br />Graminfo:
              <ul>
                <xsl:for-each select="Graminfo">
                  <li>
                    <xsl:value-of select="text()" />
                  </li>
                </xsl:for-each>
              </ul></xsl:when>
            </xsl:choose>
            <xsl:if test="Cycle">
              <br/><xsl:text disable-output-escaping="yes">&lt;</xsl:text><xsl:value-of select="Cycle/Comment"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text><xsl:value-of select="Cycle/Definition"/>
              <xsl:choose>
                <xsl:when test="Cycle/Example">
                  <br /><ul>Examples:
                  <ul>
                    <xsl:for-each select="Cycle/Example">
                      <li>
                        <xsl:value-of select="text()" />
                      </li>
                    </xsl:for-each>
                </ul></ul></xsl:when>
              </xsl:choose>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="Idiom">
              <br />Idioms:
              <ul>
                <xsl:for-each select="Idiom">
                  <li>
                  <b>
                    <xsl:value-of select="text()" />
                  </b>:
                  <xsl:value-of select="Definition" /></li>
                </xsl:for-each>
              </ul></xsl:when>
            </xsl:choose>
          </li>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>
</xsl:stylesheet>