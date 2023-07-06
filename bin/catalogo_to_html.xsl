<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd tei" version="2.0">
    <xd:doc type="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 28, 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:output method="html" indent="yes"/>
    <xsl:param name="css">../../assets/main.scss</xsl:param>
    <xsl:param name="root_directory">../catalogo</xsl:param>

    <xd:doc>
        <xd:desc>
            <xd:p>A named template to generate the HTML head element.</xd:p>
            <xd:p>Creates a uniform head element for all the HTML pages. The <xd:i>level</xd:i>
                parameter is used to specify the depth of the generated HTML document in the
                application tree, so that relative paths to assets can be established.</xd:p>
        </xd:desc>
        <xd:param name="level">
            <xd:p>An xs:integer specifying the level in the catalogo tree.</xd:p>
        </xd:param>
    </xd:doc>
    <xsl:template name="createHead">
        <xsl:param name="level" select="1" as="xs:integer"/>
        <xsl:variable name="href">
            <xsl:choose>
                <xsl:when test="$level = 1">
                    <xsl:text>../assets/catalogo.css</xsl:text>
                </xsl:when>
                <xsl:when test="$level = 2">
                    <xsl:text>../../assets/catalogo.css</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>../assets/catalogo.css</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <head>
            <title>Catalogo Cicognara</title>
            <link rel="stylesheet" href="{$href}"/>
        </head>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>A named template to generate the masthead on pages</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="createSiteMastHead">

        <header id="pageheader" class="site-header" role="banner">

            <div class="wrapper">
                <a class="site-title" rel="author" href="/">The Digital Cicognara Library</a>
                <nav class="site-nav">
                    <input type="checkbox" id="nav-trigger" class="nav-trigger"/>
                    <label for="nav-trigger">
                        <span class="menu-icon">
                            <svg viewBox="0 0 18 15" width="18px" height="15px">
                                <path
                                    d="M18,1.484c0,0.82-0.665,1.484-1.484,1.484H1.484C0.665,2.969,0,2.304,0,1.484l0,0C0,0.665,0.665,0,1.484,0 h15.032C17.335,0,18,0.665,18,1.484L18,1.484z M18,7.516C18,8.335,17.335,9,16.516,9H1.484C0.665,9,0,8.335,0,7.516l0,0 c0-0.82,0.665-1.484,1.484-1.484h15.032C17.335,6.031,18,6.696,18,7.516L18,7.516z M18,13.516C18,14.335,17.335,15,16.516,15H1.484 C0.665,15,0,14.335,0,13.516l0,0c0-0.82,0.665-1.483,1.484-1.483h15.032C17.335,12.031,18,12.695,18,13.516L18,13.516z"
                                />
                            </svg>
                        </span>
                    </label>

                    <div class="trigger">
                        <a class="page-link" href="/about.html">About</a>
                        <a class="page-link" href="/partners.html">Partners</a>
                        <a class="page-link" href="/research.html">Research</a>
                        <a class="page-link" href="/contributor.html">Contribute</a>
                        <a class="page-link" href="/contact.html">Contact</a>
                        <a class="page-link" href="/news.html">News</a>
                    </div>
                </nav>
            </div>
        </header>


    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>A named template to generate the site footer</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="createSiteFooter">
      <footer id="site-footer">
        <section class="partners" id="partners">
          <ul>
            <li><a href="https://www.vaticanlibrary.va/home.php" target="_blank"><img src="/assets/images/vatican.png" alt="Biblioteca Apostolica Vaticana" title="Biblioteca Apostolica Vaticana" /></a></li>
            <li><a href="http://library.columbia.edu/" target="_blank"><img src="/assets/images/columbia.png" alt="Columbia University Library" title="Columbia University Library" /></a></li>
            <li><a href="http://www.frick.org/research/library" target="_blank"><img src="/assets/images/frick.png" alt="Frick Art Reference Library" title="Frick Art Reference Library" /></a></li>
            <li><a href="https://www.getty.edu/research/" target="_blank"><img src="/assets/images/getty.png" alt="Getty Research Institute" title="Getty Research Institute" /></a></li>
            <li><a href="http://library.harvard.edu/" target="_blank"><img src="/assets/images/harvard.png" alt="Harvard University Library" title="Harvard University Library" /></a></li>
            <li><a href="http://www.ub.uni-heidelberg.de/" target="_blank"><img src="/assets/images/heidelberg.png" alt="Heidelberg University Library" title="Heidelberg University Library" /></a></li>
            <li><a href="https://library.nga.gov/" target="_blank"><img src="/assets/images/national_gallery_of_art.png" alt="National Gallery of Art Library" title="National Gallery of Art Library" /></a></li>
            <li><a href="http://library.princeton.edu/" target="_blank"><img src="/assets/images/princeton.png" alt="Princeton University Library" title="Princeton University Library" /></a></li>
            <li><a href="http://www.library.illinois.edu/" target="_blank"><img src="/assets/images/illinois.png" alt="University of Illinois at Urbana-Champaign Library" title="University of Illinois at Urbana-Champaign Library" /></a></li>
          </ul>
          <span class="footer-bottom">Copyright <xsl:value-of  select="year-from-date(current-date())"/> The Trustees of Princeton University. All rights reserved.</span>
        </section>
      </footer>
    </xsl:template>

    <!--
    HTML-page-generating templates
    -->

    <xd:doc>
        <xd:desc>
            <xd:p>The site is generated from the catalogo.tei.xml source file. That file comprises a
                teiCorpus containing the two volumes of the Catalogo. </xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
            <xsl:call-template name="createHead"/>
            <body class="container">
                <xsl:call-template name="createSiteMastHead"/>
                <xsl:apply-templates select="tei:teiCorpus"/>
                <xsl:call-template name="createSiteFooter"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiCorpus">
        <nav id="side">
            <xsl:apply-templates select="tei:TEI" mode="toc"/>
        </nav>
        <main id="main">
            <xsl:apply-templates select="tei:TEI"/>
        </main>
    </xsl:template>

    <xsl:template match="tei:TEI" mode="toc">
        <section>
            <h1>
                <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
            </h1>
            <ul>
                <xsl:apply-templates select="tei:text" mode="toc"/>
            </ul>
        </section>
    </xsl:template>

    <xsl:template match="tei:TEI">
        <xsl:apply-templates select="tei:text"/>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>

    <xsl:template match="tei:text">
        <xsl:apply-templates select="tei:front"/>
        <xsl:apply-templates select="tei:body"/>
    </xsl:template>

    <xsl:template match="tei:front">
        <xsl:apply-templates select=".//tei:div[@type = 'preface']"/>
    </xsl:template>

    <xsl:template match="tei:body">
        <xsl:apply-templates select=".//tei:div[@type = 'section']" mode="section"/>
    </xsl:template>

    <xsl:template match="tei:text" mode="toc">
        <xsl:apply-templates select="tei:front" mode="toc"/>
        <xsl:apply-templates select="tei:body" mode="toc"/>
    </xsl:template>

    <xsl:template match="tei:front" mode="toc">
        <xsl:apply-templates select="tei:div[@type = 'preface']" mode="toc"/>
    </xsl:template>

    <xsl:template match="tei:body" mode="toc">
        <xsl:apply-templates select="tei:div[@type = 'section']" mode="toc"/>
    </xsl:template>

    <xsl:template match="tei:div[@type = 'preface']">
        <details id="{@n}">
            <summary>
                <xsl:apply-templates select="tei:head[1]"/>
            </summary>
            <section>
                <xsl:apply-templates select="tei:head[1]/following-sibling::*"/>
            </section>
        </details>

    </xsl:template>

    <xsl:template match="tei:div[@type = 'preface']" mode="toc">
        <li>
            <a href="#{@n}">
                <xsl:value-of select="tei:head[1]"/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="tei:div[@type = 'section']" mode="toc">
        <xsl:param name="base"/>
        <xsl:variable name="link">
            <xsl:choose>
                <xsl:when test="$base">
                    <xsl:value-of select="concat($base, '#', @n)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('#', @n)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <li>
            <a href="{$base}#{@n}">
                <xsl:apply-templates select="tei:head" mode="listitem"/>
            </a>
        </li>
    </xsl:template>


    <xsl:template match="tei:div[@type = 'section']" mode="section">
        <section id="{@n}">
            <xsl:apply-templates select="tei:head[1]"/>
            <xsl:apply-templates select="tei:head[1]/following-sibling::*"/>
        </section>
    </xsl:template>

    <xsl:template match="tei:pb[@type = 'cico']">
        <div class="pageBreak">
            <span>
                <xsl:value-of select="@n"/>
            </span>
        </div>
    </xsl:template>

    <xsl:template match="tei:head" mode="listitem">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:head">
        <header>
            <h2>
                <xsl:apply-templates/>
            </h2>
        </header>
    </xsl:template>

    <xsl:template match="tei:list[@type = 'catalog']">
        <ol class="catalog">
            <xsl:apply-templates/>
        </ol>
    </xsl:template>

    <xsl:template match="tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:label">
        <xsl:variable name="ciconum">
            <xsl:value-of select="parent::tei:item/@n"/>
        </xsl:variable>
        <xsl:variable name="itemid" select="parent::tei:item/@xml:id"/>
        <a href="itempages/{$ciconum}.html">
            <span class="ciconum">
                <xsl:apply-templates/>
            </span>
        </a>
    </xsl:template>

    <xsl:template match="tei:label" mode="standalone">
        <xsl:variable name="ciconum">
            <xsl:value-of select="parent::tei:item/@n"/>
        </xsl:variable>
        <xsl:variable name="itemid" select="parent::tei:item/@xml:id"/>
        <a href="../itempages/{$itemid}.html">
            <span class="ciconum">
                <xsl:apply-templates/>
            </span>
        </a>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <span class="bibl">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:author">
        <xsl:variable name="textbefore" select="preceding-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textbefore/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
        <span class="author">
            <xsl:apply-templates/>
        </span>

    </xsl:template>

    <xsl:template match="tei:note">
        <div class="note">
            <xsl:apply-templates/>
        </div>
    </xsl:template>


    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>These templates handle the mixed-content situation in which successive elements
                need to have whitespace between them. </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:title">

        <xsl:variable name="ciconum">
            <xsl:value-of select="ancestor::tei:item/@n"/>
        </xsl:variable>

        <xsl:variable name="textbefore" select="preceding-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textbefore/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
        <a href="itempages/{$ciconum}.html">
            <span class="title">
                <xsl:apply-templates/>
            </span>
        </a>

        <xsl:variable name="textafter" select="following-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textafter/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:pubPlace">
        <xsl:variable name="textbefore" select="preceding-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textbefore/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
        <span class="pubPlace">
            <xsl:apply-templates/>
        </span>
        <xsl:variable name="textafter" select="following-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textafter/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:publisher">
        <xsl:variable name="textbefore" select="preceding-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textbefore/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
        <span class="publisher">
            <xsl:apply-templates/>
        </span>
        <xsl:variable name="textafter" select="following-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textafter/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:date">
        <xsl:variable name="textbefore" select="preceding-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textbefore/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
        <span class="date">
            <xsl:apply-templates/>
        </span>
        <xsl:variable name="textafter" select="following-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textafter/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:extent">
        <xsl:variable name="textbefore" select="preceding-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textbefore/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
        <span class="extent">
            <xsl:apply-templates/>
        </span>
        <xsl:variable name="textafter" select="following-sibling::node()[1][self::text()]"/>
        <xsl:if test="$textafter/preceding-sibling::node()[self::*]">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Item templates -->

    <xsl:template match="tei:biblStruct">
        <li>
            <dl>
                <dt>title</dt>
                <dd>
                    <xsl:apply-templates select="tei:monogr/tei:title"/>
                </dd>

                <dt>agents</dt>
                <xsl:for-each select="tei:monogr/tei:respStmt">
                    <dd>
                        <xsl:apply-templates select="current()"/>
                    </dd>
                </xsl:for-each>

                <dt>imprint</dt>
                <dd>
                    <xsl:apply-templates select="tei:monogr/tei:imprint"/>
                </dd>

                <dt>identifiers</dt>
                <dd>
                    <xsl:apply-templates select="tei:monogr/tei:idno"/>
                </dd>
            </dl>
        </li>
    </xsl:template>

    <xsl:template match="tei:bibl" mode="structured">
        <dl>
            <dt>author</dt>
            <dd>
                <xsl:apply-templates select="tei:author"/>
            </dd>

            <dt>title</dt>
            <dd>
                <xsl:apply-templates select="tei:title"/>
            </dd>

            <dt>place of publication</dt>
            <dd>
                <xsl:apply-templates select="tei:pubPlace"/>
            </dd>

            <dt>date</dt>
            <dd>
                <xsl:apply-templates select="tei:date"/>
            </dd>

            <dt>extent</dt>
            <dd>
                <xsl:apply-templates select="tei:extent"/>
            </dd>
        </dl>
    </xsl:template>
</xsl:stylesheet>
