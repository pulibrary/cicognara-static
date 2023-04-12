<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 1, 2023</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes"/>
    
    
    <xsl:param name="viewpages">../viewpages</xsl:param>
    <xsl:param name="css">../../assets/item-pages.css</xsl:param>

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
                        <a class="page-link" href="/faq.html">FAQ</a>
                        <a class="page-link" href="/checklist.html">Metadata</a>
                        <a class="page-link" href="/contact.html">Contact</a>
                        <a class="page-link" href="/news.html">News</a>
                    </div>
                </nav>
                <p>
                    <xsl:value-of
                        select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </p>
            </div>
        </header>
    </xsl:template>
    
    <xsl:template match="tei:teiCorpus">
        <xsl:variable name="ciconum">
            <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='cico']"/>
        </xsl:variable>
        <xsl:result-document href="{$ciconum}.html" indent="yes">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
                <link rel="stylesheet" href="{$css}"/>
            </head>
            
            <body>
                <xsl:call-template name="createSiteMastHead"/>
                <main id="main">
                    <iframe allowfullscreen="true" src="{$viewpages}/{$ciconum}.html" />
                </main>
                <xsl:call-template name="createSiteFooter"/>
            </body>
        </html>
        </xsl:result-document>
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
   
</xsl:stylesheet>