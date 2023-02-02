#!/usr/bin/env ruby

require "erb"
require "fileutils"
require "logger"
require "nokogiri"
require "json"

template = %(
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Cico digital editions</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"></link>
        <meta charset="UTF-8"></meta>
         <script src="https://unpkg.com/mirador@latest/dist/mirador.min.js"></script>
    </head>
    <body>
      <div id="the-viewer"/>
      <script type="text/javascript">
        const mirador = Mirador.viewer({
               "id": "the-viewer",
               "windows": <%= windows %>,
               "catalog": <%= catalog %>
                });
      </script>
    </body>
</html>
)

basedir = "#{File.dirname(__FILE__)}/../catalogo"
outdir = "#{basedir}/html/viewpages"
sourcedir = "#{basedir}/items"

ns = {'tei' => "http://www.tei-c.org/ns/1.0"}

FileUtils.mkdir_p outdir

Dir["#{sourcedir}/*.xml"].each do |file|
  windows_arr = []
  catalog_arr = []

  corpus = Nokogiri::XML(File.read(file))
  ciconum = corpus.xpath("tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno", ns).text

  docs = corpus.xpath('//tei:TEI', ns)

  docs.each do |doc|
    provider = doc.xpath('.//tei:titleStmt/tei:respStmt/tei:orgName', ns)
    authorities = doc.xpath('.//tei:authority', ns)

    facs = doc.xpath('.//tei:facsimile/tei:media/@url', ns)


    if authorities.any? { |a| a.text == "Fondo Cicognara (Biblioteca apostolica vaticana)"}
      windows_arr << { manifestId: facs.text }
    end

    catalog_arr << {
      manifestId: facs.text,
      provider: provider.text
    }
  end

  catalog = catalog_arr.to_json
  windows = windows_arr.to_json

  html = ERB.new(template).result(binding)
  File.open("#{outdir}/#{ciconum}.html", "w") { |f| f.write(html) }
end
