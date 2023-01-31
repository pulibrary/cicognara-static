xquery version "3.0" encoding "UTF-8";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace dc = "http://purl.org/dc/elements/1.1/";
declare namespace dcterms="http://purl.org/dc/terms/";
declare namespace gettyterms="http://portal.getty.edu/terms/gri/";

let $target_directory := "/tmp/corpora/"

let $getty_docs := collection("/db/apps/cicognara/data/getty_tei")/tei:TEI

let $ciconums := distinct-values($getty_docs//tei:idno[@type = 'cico'])


for $cico in subsequence($ciconums, 1, 10)
let $docs := $getty_docs[.//tei:idno[@type='cico'] = $cico]
let $corpus :=
<teiCorpus xmlns="http://www.tei-c.org/ns/1.0">
<teiHeader>
    <fileDesc>
        <titleStmt>
            <title>Catalogo Cicognara Number {$cico}</title>
        </titleStmt>
        <publicationStmt>
            <publisher>
               <orgName>Digital Cicognara Library</orgName>
               <ref>https://cicognara.org</ref>
            </publisher>
        </publicationStmt>
        <sourceDesc>
            <p>later</p>
        </sourceDesc>
    </fileDesc>
</teiHeader>
{ $docs }
</teiCorpus>

let $path := concat($target_directory, $cico, ".tei.xml")
return file:serialize($corpus, $path,("omit-xml-declaraion=yes", "indent=yes"))