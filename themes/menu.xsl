<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- menu-nested on HP -->
  <xsl:template match="div[contains(@class, 'menu')]/div">
    <xsl:copy>
      <div class="part menu-nested">
        <xsl:apply-templates select="*[not(contains(@class, 'section'))]"/>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'section')]"/>
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="div[contains(@class, 'menu')]/div/div[contains(@class, 'section')]">
    <xsl:apply-templates/>
  </xsl:template>
  
  <!-- soups on regular_menu -->
  <xsl:template match="div[contains(@class, 'soups')]/div">
    <xsl:copy>
      <div>
        <xsl:apply-templates select="*[not(contains(@class, 'multiple'))]"/>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'multiple')]"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
