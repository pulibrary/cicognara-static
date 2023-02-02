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
                <header id="pageHeader" class="masthead">
                    <p>
                        <a href="/">The Cicognara Digital Library</a>
                    </p>
                    <nav>
                        <ul class="breadcrumb">
                            <li>
                                <a href="../index.html">Catalogo</a>
                            </li>          
                        </ul>
                    </nav>
                </header>
                <header id="metadata">
                    <div class="bibl">
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl" />
                    </div>
                </header>
                <main id="main">
                    <iframe allowfullscreen="true" src="{$viewpages}/{$ciconum}.html" />
                </main>
                <footer id="pageFooter">
                    <span>Copyright 2023 The Trustees of Princeton University. All rights reserved.</span>
                </footer>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
   
</xsl:stylesheet>