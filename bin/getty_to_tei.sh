#!/bin/sh

CUR=`dirname $0`
DATADIR=$CUR/../tmp/
OUTDIR=$CUR/../catalogo/
java -cp ./saxon-he-10.5.jar net.sf.saxon.Transform -s:$DATADIR/cicorecords -xsl:./getty_to_tei.xsl -o:$OUTDIR/getty
