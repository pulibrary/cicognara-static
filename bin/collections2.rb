#!/usr/bin/env ruby

# note: this script expects the latest dump to be downloaded and extracted into
# the ./resources/ directory - see fetch.sh

# collections.rb - find items with Cicognara numbers and IIIF manifests and build
# a collection manifest for each Cicognara number with the linked digital objects
require "fileutils"
require "json"

FileUtils.mkdir_p "./collections2"

data = {}
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
    dclnum.each do |cn|
      data[cn] = [] unless data[cn]
      arr = data[cn]
      arr << obj
    end
  end
end

data.keys.each do |dclnum|
  puts dclnum
  cm = {"@context":"http://iiif.io/api/presentation/2/context.json",
        "@id": "https://cicognara.org/collections/#{dclnum}.json",
        "@type": "sc:Collection",
         label: ["Digital Objects Linked to Cicognara #{dclnum}"],
         manifests: data[dclnum] }
  File.open("collections2/#{dclnum}.json", "w") { |f| f.write(cm.to_json) }
end