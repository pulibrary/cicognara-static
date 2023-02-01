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
        <header id="pageHeader" class="masthead">
            <p>
                <a href="/">The Cicognara Digital Library</a>
            </p>
        </header>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>A named template to generate the site footer</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="createSiteFooter">
        <footer id="pageFooter">
            <span>Copyright 2023 The Trustees of Princeton University. All rights reserved.</span>
        </footer>
    </xsl:template>


<!-- 
    HTML-page-generating templates
    -->

    <xd:doc>
        <xd:desc>
            <xd:p>The site is generated from the catalogo.tei.xml source file. That file
            comprises a teiCorpus containing the two volumes of the Catalogo, plus the Getty
            records, which are Xincluded.
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:teiCorpus">
        <xsl:result-document indent="yes" method="html" href="{$root_directory}/index.html">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
                <xsl:call-template name="createHead"/>
                <body class="container">
                    <header id="pageHeader" class="masthead">
                        <p>
                            <a href="/">The Cicognara Digital Library</a>
                        </p>
                    </header>
                    <nav id="side">
                        <xsl:apply-templates
                            select="tei:TEI[@xml:id = 'tomo_primo']/tei:text/tei:body" mode="toc"/>
                        <xsl:apply-templates
                            select="tei:TEI[@xml:id = 'tomo_secondo']/tei:text/tei:body" mode="toc"/>
                    </nav>
                    <main id="main">
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
                        <xsl:apply-templates
                            select="tei:TEI/tei:text/tei:body//tei:div[@type = 'section']"
                            mode="section"/>
                    </main>
                    <xsl:call-template name="createSiteFooter"/>
                </body>
            </html>
        </xsl:result-document>
        <xsl:apply-templates select="//tei:list[@type = 'catalog']/tei:item" mode="standalone"/>
    </xsl:template>
    
    <xsl:template match="tei:item" mode="standalone">
        <xsl:variable name="dclnums" select="tokenize(@corresp)"/>
        <xsl:variable name="biblStructs" select="id('gettyBibls')/tei:biblStruct"/>
        <xsl:result-document indent="yes" method="html" href="{$root_directory}/items/{@n}.html">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
                <head>
                    <title>Catalogo Cicognara</title>
                    <link rel="stylesheet" href="../../assets/item-pages.css"/>
                </head>
                <body>
                    <header id="pageHeader" class="masthead">
                        <p>
                            <a href="/">The Cicognara Digital Library</a>
                        </p>
                        <nav>
                            <ul class="breadcrumb">
                                <li>
                                    <a href="../index.html">Catalogo</a>
                                </li>
                                <li>
                                    <a href="../index.html#{ancestor::tei:div[@type='section']/@n}">
                                        <xsl:value-of select="ancestor::tei:div[@type='section']/tei:head" />
                                    </a>
                                </li>
                                
                            </ul>
                        </nav>
                    </header>
                    
                    <header id="metadata">
                        <div class="bibl">
                            <xsl:apply-templates select="tei:bibl" mode="structured"/>
                        </div>
                        
                        <div class="notes">
                            <xsl:apply-templates select="tei:note"/>
                        </div>
                    </header>
                    
                    <main id="main"> 
                        <dl>
                            <xsl:for-each select="$dclnums">
                                <xsl:variable name="dcl" select="substring-after(current(), 'dcl:')"/>
                                <xsl:variable name="distributors"
                                    select="$biblStructs[.//tei:idno = $dcl]/tei:monogr/tei:imprint/tei:distributor"/>
                                
                                <dt>
                                    <dl>
                                        <dt><xsl:value-of select="$dcl"/></dt>
                                        <xsl:for-each select="$distributors">
                                            <dd><xsl:apply-templates /></dd>
                                        </xsl:for-each>
                                    </dl>
                                </dt>
                                <dd>
                                    <iframe allowfullscreen="true" src="../dcl/{$dcl}.html"/>
                                </dd>
                            </xsl:for-each>
                        </dl>
                    </main>
                    <xsl:call-template name="createSiteFooter"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>
    

    <xsl:template match="tei:body" mode="toc">
        <ul class="toc">
            <xsl:apply-templates select="tei:div[@type = 'section']" mode="toc"/>
        </ul>
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
            <xsl:apply-templates/>
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
        <a href="items/{$ciconum}.html">
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
        <a href="../items/{$itemid}.html">
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
            <xd:p>These templates handle the mixed-content situation in which successive
                elements need to have whitespace between them.
            </xd:p>
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
        <a href="viewpages/{$ciconum}.html">
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
