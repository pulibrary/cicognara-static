<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">

    <xsl:output method="html" indent="yes"/>

    <xsl:param name="root_directory">/tmp/catalogo_pages</xsl:param>

    <xsl:template match="tei:teiCorpus">
        <xsl:apply-templates select="tei:TEI"/>
    </xsl:template>

    <xsl:template match="tei:TEI">
        <xsl:result-document indent="yes" method="html" href="{$root_directory}/{@xml:id}.html">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
                <head>
                    <title>
                        <xsl:value-of select="@xml:id"/>
                    </title>
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="@xml:id"/>
                    </h1>
                    <xsl:apply-templates select="tei:text/tei:body" mode="toc"/>
                </body>
            </html>
        </xsl:result-document>
        <xsl:apply-templates select="tei:text/tei:body//tei:div[@type = 'section']" mode="page"/>
    </xsl:template>

    <xsl:template match="tei:body" mode="toc">
        <ul>
            <xsl:apply-templates select="tei:div[@type = 'section']" mode="toc"/>
        </ul>
    </xsl:template>

    <xsl:template match="tei:div[@type = 'section']" mode="toc">
        <li>
            <a href="{$root_directory}/sections/{@n}.html">
                <xsl:apply-templates select="tei:head"/>
            </a>
        </li>
    </xsl:template>


    <!-- stand-alone sections -->

    <xsl:template match="tei:div[@type = 'section']" mode="page">
        <xsl:result-document indent="yes" method="html" href="{$root_directory}/sections/{@n}.html">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
                <head>
                    <title>
                        <xsl:apply-templates select="tei:head"/>
                    </title>
                </head>
                <body>
                    <header>
                        <h1>
                            <xsl:apply-templates select="tei:head"/>
                        </h1>
                    </header>
                    <main>
                        <xsl:apply-templates select="tei:list[@type = 'catalog']" mode="listing"/>
                    </main>

                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:list" mode="listing">
        <ol type="catalog">
            <xsl:apply-templates select="tei:item" mode="listing" />
        </ol>
    </xsl:template>
    
    <xsl:template match="tei:item" mode="listing">
        <li><xsl:apply-templates select="tei:label" /></li>
    </xsl:template>
</xsl:stylesheet>
