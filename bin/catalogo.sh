#!/bin/bash


# catalogo.sh - download the most recent Catalogo TEI XML and generate HTML version

CUR=`dirname $0`
DATADIR=$CUR/../tmp
OUTDIR=$CUR/../catalogo/html
SAXON=$CUR/saxon-he-10.5.jar


# fetch catalogo TEI XML
#wget https://raw.githubusercontent.com/pulibrary/cicognara-catalogo/main/catalogo.tei.xml -P $DATADIR

# generate HTML
java -cp  $SAXON net.sf.saxon.Transform -s:$DATADIR/catalogo.tei.xml -xsl:$CUR/catalogo_html.xsl -o:$OUTDIR/index.html
