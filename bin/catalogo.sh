#!/bin/sh

# catalogo.sh - download the most recent Catalogo TEI XML and generate HTML version in /catalogo/

CUR=`dirname $0`
cd $CUR/../tmp

# fetch catalogo TEI XML
wget https://raw.githubusercontent.com/pulibrary/cicognara-catalogo/main/catalogo.tei.xml

# generate HTML
cd ..
java -cp bin/saxon-he-10.5.jar net.sf.saxon.Transform -s:tmp/catalogo.tei.xml -xsl:bin/catalogo_html.xsl
