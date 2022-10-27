#!/usr/bin/env ruby

require "erb"
require "fileutils"
require "json"

template = %(
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Cico digital editions</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"></link>
            <!-- Container element of Mirador whose id should be passed to the instantiating call as "id" -->

        <meta charset="UTF-8"></meta>
         <script src="https://unpkg.com/mirador@latest/dist/mirador.min.js"></script>
    </head>
    <body>
                  <header>
                        <p>Header Things</p>
                    </header>
                    <nav>
                        <ul class="breadcrumb">
                            <li><a href="../catalogo.html">Catalogo</a></li>
                        </ul>
                    </nav>

        <!-- Container element of Mirador whose id should be passed to the instantiating call as "id" -->
        <div id="my-mirador"/>

        <script type="text/javascript">
        const mirador = Mirador.viewer({
  "id": "my-mirador",

  "windows": <%= windows %>,
  "catalog": <%= catalog %>

});
</script>
    </body>
</html>
)

catalogs = {}
fiche = {}
puts "processing resources/*.json"
processed = 0
Dir["resources/*.json"].each do |file|
  print "."  if (processed += 1) % 5000 == 0
  json = JSON.parse(File.open(file).read)
  dclnum = json["identifier"].select { |id| id["@type"] == "dclNumber" }.map { |id| id["value"] }
  # TODO these numbers should probably be cleaned up a lot (strip or split on
  # punctuation, remove letters, etc., etc.

  microfiche = (json["extent"] || []).map { |ext| ext["value"] }.join(" ").include?("microfiche")
  unless dclnum.empty? || (json["hasFormat"] || []).empty?
    puts "processing #{dclnum}"
    dclnum = dclnum.map{|x| x.gsub(/[.,\/]/, '_')}
    manifest = json["hasFormat"].map { |fmt| fmt["value"] }.first
    title = json["title"].map { |ttl| ttl["value"] }.first
    contrib = json["grpContributor"].map { |con| con["value"] }.first
    obj = {"@context":"http://iiif.io/api/presentation/2/context.json",
           "@id": manifest, "@type":"sc:Manifest", label: [title],
            metadata: [{ label:"contributor", value: [contrib]},
                       { label:"microfiche", value: [microfiche]}]}

    dclnum.each do |num|
      catalogs[num] = [] unless catalogs[num]
      arr = catalogs[num]
      arr << {manifestId: manifest}
      # keep and additional set of microfiche to start with
      if microfiche
      fiche[num] = [] unless fiche[num]
      arr = fiche[num]
      arr << {manifestId: manifest}
      end
    end
  end
end

FileUtils.mkdir_p "../catalogo/dcl"

catalogs.keys.each do |dclnum|
  catalog = catalogs[dclnum].to_json
  windows = fiche[dclnum].to_json

  html = ERB.new(template).result(binding)
  File.open("../catalogo/dcl/#{dclnum}.html", "w") { |f| f.write(html) }
end
