#!/bin/sh

CUR=`dirname $0`
DATADIR=$CUR/../catalogo/items
OUTDIR=$CUR/../catalogo/html/items
java -cp ./saxon-he-10.5.jar net.sf.saxon.Transform -s:$DATADIR -xsl:./tei_items_to_html.xsl -o:$OUTDIR
