<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- menu-nested on HP -->
  <xsl:template match="div[@class='part menu']/div">
    <xsl:copy>
      <div class="part menu-nested">
        <div>
          <xsl:apply-templates select="*[not(contains(@class, 'section'))]"/>
        </div>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'section')]"/>
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="div[contains(@class, 'menu')]/div/div[contains(@class, 'section')]">
    <xsl:apply-templates/>
  </xsl:template>
  
  <!-- IMG -->
  <!-- soups, salads, grilled_steaks -->
  <xsl:template match="div[contains(@class, 'soups') or contains(@class, 'salads') or contains(@class, 'grilled_steaks') or contains(@class, 'concept')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-img</xsl:attribute>
      <div>
        <xsl:apply-templates select="*[not(contains(@class, 'list'))]"/>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'list')]"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- CARD -->
  <!-- daily_offer, weekend_events -->
  <!-- frying_pan_wok, desserts, side_dishes, condiments_and_sauces on regular_menu -->
  <!-- steaks on about_us -->
  <xsl:template match="div[contains(@class, 'frying_pan_wok') or contains(@class, 'daily_offer') or contains(@class, 'weekend_events') or contains(@class, 'desserts') or contains(@class, 'side_dishes') or contains(@class, 'condiments_and_sauces') or contains(@class, 'part steaks')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-card</xsl:attribute>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <!-- all parts on driks_list -->
  <xsl:template match="dl[contains(@class, 'meal')][ancestor::body[@data-link='/driks_list']]/../node()">
    <xsl:copy>
      <xsl:attribute name="class">content-card</xsl:attribute>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- GROUP -->
  <!-- daily_offer, weekend_events -->
  <xsl:template match="div[contains(@class, 'daily_offer')][ancestor::body[@data-link='/menu']]">
    <xsl:text disable-output-escaping="yes">&lt;div class="part content-group daily_any_weekend"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="div[contains(@class, 'weekend_events')][ancestor::body[@data-link='/menu']]">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
  </xsl:template>
  <!-- group kids_dishes, condiments_and_sauces -->
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
  
  <!-- SPLIT -->
  <!-- desserts -->
  <xsl:template match="div[contains(@class, 'desserts')]">
    <div class="part content-group desserts-group">
      <div>
        <xsl:copy>
          <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
        <div class="part desserts2">
          <div class="content-card">
            <div>
               <xsl:copy-of select=".//dl[contains(@class, 'meal')][position() > 2]"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="div[contains(@class, 'desserts')]//dl[contains(@class, 'meal')][position() > 2]"/>
  
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
