#!/usr/bin/env ruby

require "erb"
require "fileutils"
require "json"

teidoc = %(
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
        schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
      <fileDesc>
         <titleStmt>
            <title>Getty Portal editions</title>
         </titleStmt>
         <publicationStmt>
            <p>Publication Information</p>
         </publicationStmt>
         <sourceDesc>
            <p>Information about the source</p>
         </sourceDesc>
      </fileDesc>
  </teiHeader>
  <text>
      <body>
         <listBibl xml:id="gettyBibls">
         <% bibls.each do |bibl| %>
         <biblStruct>
            <monogr>
            <% bibl[:idnos].each do |idno| %>
               <idno type="dclNumber"><%= idno %></idno>
            <% end %>
               <imprint>
                  <distributor><%= bibl[:distributor] %></distributor>
               </imprint>
            </monogr>
         </biblStruct>
         <% end %>
         </listBibl>
      </body>
  </text>
</TEI>
)

bibls = []
puts "processing resources/*.json"
processed = 0
Dir["../tmp/resources/*.json"].each do |file|
  print "."  if (processed += 1) % 5000 == 0
  json = JSON.parse(File.open(file).read)
  dclnum = json["identifier"].select { |id| id["@type"] == "dclNumber" }.map { |id| id["value"] }
  unless dclnum.empty? || (json["hasFormat"] || []).empty?
    puts "processing #{dclnum}"
    dclnums = dclnum.map{|x| x.gsub(/[.,\/]/, '_')}
    distributor = json["grpContributor"].map { |con| con["value"] }.first
    obj = {"distributor": distributor,
           "idnos": dclnums}

    bibls.append(obj)
  end
end

FileUtils.mkdir_p "../catalogo"

html = ERB.new(teidoc).result(binding)
File.open("../catalogo/getty.tei.xml", "w") { |f| f.write(html) }
