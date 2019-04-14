<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- nabidka on HP -->
  <xsl:template match="div[@class='part nabidka']/div">
    <xsl:copy>
      <div class="part nabidka-nested">
        <div>
          <xsl:apply-templates select="*[not(contains(@class, 'section'))]"/>
        </div>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'section')]"/>
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="div[contains(@class, 'nabidka')]/div/div[contains(@class, 'section')]">
    <xsl:apply-templates/>
  </xsl:template>
  
  <!-- IMG -->
  <!-- polevky, salatove_talire, grilovane_steaky -->
  <xsl:template match="div[contains(@class, 'polevky') or contains(@class, 'salatove_talire') or contains(@class, 'grilovane_steaky') or contains(@class, 'koncept')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-img</xsl:attribute>
      <div>
        <xsl:apply-templates select="*[not(contains(@class, 'list'))]"/>
      </div>
      <xsl:apply-templates select="div[contains(@class, 'list')]"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- CARD -->
  <!-- denni_nabidka, akce -->
  <!-- z_panve_fritezy_a_woku, sladkosti, prilohy, pochutiny_omacky on regular_menu -->
  <!-- steaks on about_us -->
  <xsl:template match="div[contains(@class, 'z_panve_fritezy_a_woku') or contains(@class, 'denni_nabidka') or contains(@class, 'akce') or contains(@class, 'sladkosti') or contains(@class, 'pochutiny_omacky') or contains(@class, 'prilohy') or contains(@class, 'part steaky')]/div">
    <xsl:copy>
      <xsl:attribute name="class">content-card</xsl:attribute>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <!-- all parts on napojovy_listek and vinny_listek -->
  <xsl:template match="div[contains(@class, 'part')]/div[ancestor::body[@data-link='/napojovy_listek' or @data-link='/vinny_listek']]">
    <xsl:copy>
      <xsl:attribute name="class">content-card</xsl:attribute>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- GROUP -->
  <!-- denni_nabidka, akce -->
  <xsl:template match="div[contains(@class, 'denni_nabidka')][ancestor::body[@data-link='/menu']]">
    <xsl:text disable-output-escaping="yes">&lt;div class="part content-group daily_any_weekend"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="div[contains(@class, 'akce')][ancestor::body[@data-link='/nabidka']]">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
  </xsl:template>
  <!-- group prilohy, pochutiny_omacky -->
  <xsl:template match="div[contains(@class, 'prilohy')]">
    <xsl:text disable-output-escaping="yes">&lt;div class="part content-group side_and_sauces"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="div[contains(@class, 'pochutiny_omacky')]">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
  </xsl:template>
  
  <!-- SPLIT -->
  <!-- sladkosti -->
  <xsl:template match="div[contains(@class, 'sladkosti')]">
    <div class="part content-group desserts-group">
      <div>
        <xsl:copy>
          <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
        <div class="part sladkosti2">
          <div class="content-card">
            <div class="list multiple"><div>
             <xsl:copy-of select=".//dl[contains(@class, 'meal')][position() > 2]"/>
            </div></div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="div[contains(@class, 'sladkosti')]//dl[contains(@class, 'meal')][position() > 2]"/>
  
  <!-- NAVIGATION -->
  <!-- napojovy_listek, vinny_listek, stala_nabidka -->
  <xsl:template match="div[@class='contenttoc section'][ancestor::body[@data-link='/stala_nabidka'] or ancestor::body[@data-link='/vinny_listek'] or ancestor::body[@data-link='/napojovy_listek']]">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
      <ul class="button-list">
        <li><a class="nowarning button button-img" href="/stala_nabidka"><span class="fas fa-3x fa-clipboard-list">i</span>Stálá nabídka jídel</a></li>
        <li><a class="nowarning button button-img" href="/napojovy_listek"><span class="fas fa-3x fa-mug-hot">i</span>Nápojový lístek</a></li>
        <li><a class="nowarning button button-img" href="/vinny_listek"><span class="fas fa-3x fa-wine-glass-alt">i</span>Vinný lístek</a></li>
      </ul>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
