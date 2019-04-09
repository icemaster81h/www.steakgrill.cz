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
  
  <!-- soups, salads, grilled_steaks -->
  <xsl:template match="div[contains(@class, 'soups') or contains(@class, 'salads') or contains(@class, 'grilled_steaks')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-img</xsl:attribute>
      <div>
        <xsl:apply-templates select="*[not(contains(@class, 'list'))]"/>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'list')]"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- daily_offer, weekend_events -->
  <!-- frying_pan_wok, desserts, side_dishes, condiments_and_sauces on regular_menu -->
  <xsl:template match="div[contains(@class, 'frying_pan_wok') or contains(@class, 'daily_offer') or contains(@class, 'weekend_events') or contains(@class, 'desserts') or contains(@class, 'side_dishes') or contains(@class, 'condiments_and_sauces')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-card</xsl:attribute>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- kids_dishes, condiments_and_sauces -->
  <xsl:template match="div[contains(@class, 'side_dishes')]">
    <xsl:text disable-output-escaping="yes">&lt;div class="part content-group side_and_sauces"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="div[contains(@class, 'condiments_and_sauces')]">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
  </xsl:template>
  
  <!-- desserts -->
  <xsl:template match="div[contains(@class, 'desserts')]">
    <xsl:copy>
      <div class="content-group">
        <div>
          <xsl:apply-templates select="node()|@*"/>
          <div class="content-card">
            <div>
               <xsl:copy-of select=".//dl[contains(@class, 'meal')][position() = 4 or position() = 5 or position() = 6 or position() = 7]"/>
            </div>
          </div>
        </div>
      </div>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="div[contains(@class, 'desserts')]//dl[contains(@class, 'meal')][position() = 4 or position() = 5 or position() = 6 or position() = 7]"/>
  
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
