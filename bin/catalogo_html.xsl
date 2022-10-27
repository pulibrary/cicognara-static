<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs math xd tei"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 4, 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:output method="html" indent="yes"/>
    <xsl:param name="root_directory">../catalogo</xsl:param>

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

    <xsl:template name="createSiteMastHead">
        <header class="masthead">
            <p>The Cicognara Digital Library</p>
            <nav>
                <ul>
                    <li>
                        <a href="/">Home</a>
                    </li>
                </ul>
            </nav>
        </header>
    </xsl:template>


    <xsl:template name="createSiteFooter">
        <footer>
            <span>Copyright 2022 The Trustees of Princeton University. All rights reserved.</span>
        </footer>
    </xsl:template>

    <xsl:template match="tei:teiCorpus">
        <xsl:result-document indent="yes" method="html" href="{$root_directory}/index.html">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
                <xsl:call-template name="createHead"/>
                <body>
                    <xsl:call-template name="createSiteMastHead"/>
                    <main>
                        <h1>Catalogo Cicognara</h1>

                        <ol>
                            <li>
                                <a href="{$root_directory}/tomo_primo.html">Tomo Primo</a>
                            </li>
                            <li>
                                <a href="{$root_directory}/tomo_secondo.html">Tomo Secondo</a>
                            </li>
                        </ol>
                    </main>
                    <xsl:call-template name="createSiteFooter"/>
                </body>
            </html>
        </xsl:result-document>

        <xsl:apply-templates select="tei:TEI[@xml:id = 'tomo_primo']"/>
        <xsl:apply-templates select="tei:TEI[@xml:id = 'tomo_secondo']"/>
        <xsl:apply-templates select="//tei:list[@type = 'catalog']/tei:item" mode="standalone"/>
    </xsl:template>

    <xsl:template match="tei:TEI">
        <xsl:result-document indent="yes" method="html" href="{$root_directory}/{@xml:id}.html">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
                <xsl:call-template name="createHead"/>
                <body>
                    <xsl:call-template name="createSiteMastHead"/>
                    <nav>
                        <ul class="breadcrumb">
                            <li>
                                <a href="index.html">Catalogo</a>
                            </li>

                        </ul>
                    </nav>
                    <main>
                        <h2>
                            <xsl:value-of select="@xml:id"/>
                        </h2>
                        <xsl:apply-templates select="tei:text/tei:body" mode="toc"/>
                        <xsl:apply-templates select="tei:text/tei:body//tei:div[@type = 'section']"
                            mode="section"/>
                    </main>

                </body>
                <xsl:call-template name="createSiteFooter"/>
            </html>
        </xsl:result-document>
    </xsl:template>


    <xsl:template match="tei:body" mode="toc">
        <ol>
            <xsl:apply-templates select="tei:div[@type = 'section']" mode="toc"/>
        </ol>
    </xsl:template>

    <xsl:template match="tei:div[@type = 'section']" mode="toc">
        <li>
            <a href="#{@n}">
                <xsl:apply-templates select="tei:head" mode="listitem"/>
            </a>
        </li>
    </xsl:template>

    


    <!-- stand-alone sections -->

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
        <span class="author">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:note">
        <div class="note">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:title">
        <span class="title">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:pubPlace">
        <span class="pubPlace">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:date">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:extent">
        <span class="extent">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Item templates -->
    <xsl:template match="tei:item" mode="standalone">
        <xsl:variable name="dclnums" select="tokenize(@corresp)"/>
        <xsl:result-document indent="yes" method="html" href="{$root_directory}/items/{@n}.html">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
                <xsl:call-template name="createHead">
                    <xsl:with-param name="level" select="2" as="xs:integer" />
                </xsl:call-template>
                <body>
                    <xsl:call-template name="createSiteMastHead" />

                    <nav>
                        <ul class="breadcrumb">
                            <li>
                                <a href="../catalogo.html">Catalogo</a>
                            </li>
                            <li>
                                <a href="../{ancestor::tei:TEI/@xml:id}.html">
                                    <xsl:apply-templates
                                        select="ancestor::tei:TEI/tei:text/tei:front/tei:titlePage/tei:titlePart[@type = 'book']"
                                    />
                                </a>
                            </li>
                            <li>
                                <a
                                    href="../{ancestor::tei:TEI/@xml:id}.html#{ancestor::tei:div[@type='section']/@n}">
                                    <xsl:value-of
                                        select="concat('section ', ancestor::tei:div[@type = 'section']/@n)"
                                    />
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <section class="catalogo-item" id="{@xml:id}">


                        <header>
                            <div class="bibl">
                                <xsl:apply-templates select="tei:bibl"/>
                            </div>
                            <!--
                            <div class="notes">
                                <xsl:apply-templates select="tei:note"/>
                            </div>
                            -->
                        </header>
                    </section>
                    <aside>
                        <header>
                            <h2>Digitized Editions</h2>
                        </header>
                        <ul>
                            <xsl:for-each select="$dclnums">
                                <li>
                                    <a href="../dcl/{substring-after(current(), 'dcl:')}.html">
                                        <xsl:value-of select="substring-after(current(), 'dcl:')"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>

                    </aside>
                </body>
                <xsl:call-template name="createSiteFooter" />
            </html>
        </xsl:result-document>


    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>

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
