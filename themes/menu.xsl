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
  
  <!-- soups, salads on regular_menu -->
  <xsl:template match="div[contains(@class, 'soups') or contains(@class, 'salads')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-img</xsl:attribute>
      <div>
        <xsl:apply-templates select="*[not(contains(@class, 'list'))]"/>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'list')]"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- frying_pan_wok on regular_menu -->
  <!-- daily_offer, weekend_events -->
  <xsl:template match="div[contains(@class, 'frying_pan_wok') or contains(@class, 'daily_offer') or contains(@class, 'weekend_events')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-card</xsl:attribute>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
