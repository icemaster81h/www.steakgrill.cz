<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="//div[contains(@class, 'section')]/h3[1]">
    <xsl:text disable-output-escaping="yes">&lt;div class="part </xsl:text>
    <xsl:call-template name="copyid"/>
    <xsl:text disable-output-escaping="yes">"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="//div[contains(@class, 'section')]/h3[position() > 1]">
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes">&lt;div class="part </xsl:text>
    <xsl:call-template name="copyid"/>
    <xsl:text disable-output-escaping="yes">"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="//div[contains(@class, 'section')]/div[contains(@class, 'section')]/*[position() = last()]">
    <xsl:copy-of select="."/>
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="//h2[1]">
    <xsl:text disable-output-escaping="yes">&lt;div class="part </xsl:text>
    <xsl:call-template name="copyid"/>
    <xsl:text disable-output-escaping="yes">"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="//h2[position() > 1]">
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
    <xsl:text disable-output-escaping="yes">&lt;div class="part </xsl:text>
    <xsl:call-template name="copyid"/>
    <xsl:text disable-output-escaping="yes">"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="//body/div/div[contains(@class,'section')]">
    <div>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </div>
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
  </xsl:template>
  
  <xsl:template name="copyid">
    <xsl:choose>
      <xsl:when test="@id='steakgrill'">steakgrill</xsl:when>
      <xsl:when test="@id='jaroslav_honzajk'">jaroslav_honzajk</xsl:when>
      <xsl:when test="@id='o_nas'">about_us</xsl:when>
      <xsl:when test="@id='koncept'">concept</xsl:when>
      <xsl:when test="@id='steaky'">steaks</xsl:when>
      <xsl:when test="@id='video-archives'">video-archives</xsl:when>
      <xsl:when test="@id='nabidka'">menu</xsl:when>
      <xsl:when test="@id='denni_nabidka'">daily_offer</xsl:when>
      <xsl:when test="@id='akce'">weekend_events</xsl:when>
      <xsl:when test="@id='reference'">references</xsl:when>
      <xsl:when test="@id='staly_listek'">regular_menu</xsl:when>
      <xsl:when test="@id='napojovy_listek'">beverages</xsl:when>
      <xsl:when test="@id='vinny_listek'">wine_list</xsl:when>
      <xsl:when test="@id='kontakty'">contact</xsl:when>
      <xsl:when test="@id='novinky'">news</xsl:when>
      <xsl:when test="@id='contact_form'">contact_form</xsl:when>
      <xsl:when test="@id='dotazy'">questions</xsl:when>
      <xsl:when test="@id='napojovy_listek'">beverages</xsl:when>
      <xsl:when test="@id='alkoholicke'">alcoholic</xsl:when>
      <xsl:when test="@id='michane'">mixed</xsl:when>
      <xsl:when test="@id='nealkoholicke'">soft_drinks</xsl:when>
      <xsl:when test="@id='horke'">hot_drinks</xsl:when>
      <xsl:when test="@id='rumy'">rums</xsl:when>
      <xsl:when test="@id='destilaty'">spirits</xsl:when>
      <xsl:when test="@id='stala_nabidka'">regular_menu</xsl:when>
      <xsl:when test="@id='polevky'">soups</xsl:when>
      <xsl:when test="@id='hamburgery_a_testoviny'">hamburgers_and_pasta</xsl:when>
      <xsl:when test="@id='salatove_talire'">salads</xsl:when>
      <xsl:when test="@id='z_panve_fritezy_a_woku'">frying_pan_wok</xsl:when>
      <xsl:when test="@id='z_grilu_a_griddlu'">grill_griddle</xsl:when>
      <xsl:when test="@id='grilovane_steaky'">grilled_steaks</xsl:when>
      <xsl:when test="@id='sladkosti'">desserts</xsl:when>
      <xsl:when test="@id='detska_jidla'">kids_menu</xsl:when>
      <xsl:when test="@id='prilohy'">side_dishes</xsl:when>
      <xsl:when test="@id='pochutiny_omacky'">condiments_and_sauces</xsl:when>
      <xsl:when test="@id='informace'">information</xsl:when>
      <xsl:when test="@id='vinny_listek'">wine_list</xsl:when>
      <xsl:when test="@id='sekty'">sparkling_wines_and_prosecco</xsl:when>
      <xsl:when test="@id='rozlevana_vina'">house_wine</xsl:when>
      <xsl:when test="@id='bila_vina'">white_wines</xsl:when>
      <xsl:when test="@id='cervena_vina'">red_wines</xsl:when>
    </xsl:choose>
  </xsl:template>

<!--
  <xsl:template match="//div[contains(@class, 'section')]/*[last()]">
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
  </xsl:template>
-->

  <xsl:template match="//body/div/p[contains(@class,'description')]">
    <xsl:text disable-output-escaping="yes">&lt;div class="part"&gt;&lt;div&gt;</xsl:text>
    <xsl:copy-of select="."/>
    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
