#!/usr/bin/env ruby

require "fileutils"
require "json"
require "set"
require "csv"

basedir = "#{File.dirname(__FILE__)}/.."

idtypes = Set.new()

records = {}
data = {}

Dir["#{basedir}/tmp/resources/*.json"].each do |file|
  json = JSON.parse(File.open(file).read)

  json['identifier'].collect { |id| id['@type']}.each {|i| idtypes.add(i)}
  cico = json['identifier'].find {|id| id['@type'] == 'cicognaraNumber'}
  dcl = json['identifier'].find {|id| id['@type'] == 'dclNumber'}

  next unless (cico or dcl)

  data = {file: File.basename(file)}
  data[:cico] = cico['value'] if cico
  data[:dcl] = dcl['value'] if dcl

  data[:virtual_collection] = nil
  if json["isPartOf"]
    virtual_collection = json["isPartOf"].find { |x|
      x['@type'] == 'virtualCollection'
    }
    if virtual_collection
      data[:virtual_collection] = virtual_collection['label']
    end
  end

  data[:manifest] = nil

  if json['hasFormat']
    manifest = json['hasFormat'].find { |x| x['@type'] == "iiif"}
    data[:manifest] = manifest['value']
  end

  records[json['@id']] = data
end

CSV.open("/tmp/report.csv", "wb") do |csv|
  csv << ["key", "filename", "cico", "dcl", "virtual_collection", "manifest"]
  records.each do |key, data|
    csv << [key,
            data[:file],
            data[:cico],
            data[:dcl],
            data[:virtual_collection],
            data[:manifest]
           ]
  end
end
