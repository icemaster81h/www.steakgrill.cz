<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="fieldset">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="legend">
    <h2>
      <xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
      <xsl:copy-of select="text()"/>
    </h2>
  </xsl:template>
  
  <xsl:template match="form[contains(@id, 'inputvarform')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <div class="section">
        <xsl:apply-templates/>
      </div>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>