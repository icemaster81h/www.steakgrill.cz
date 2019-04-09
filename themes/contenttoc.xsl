<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="div[contains(@class, 'contenttoc')]">
    <ol class="contenttoc button-list">
      <xsl:for-each select="//h2">
        <li>
          <xsl:element name="a">
            <xsl:attribute name="href">
              #<xsl:value-of select="./@id" />
            </xsl:attribute>
            <xsl:attribute name="class">button</xsl:attribute>
            <xsl:value-of select="." />
          </xsl:element>
        </li>
      </xsl:for-each>
    </ol>
    <xsl:element name="div">
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>