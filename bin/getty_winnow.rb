#!/usr/bin/env ruby

require "fileutils"
require "logger"
require "nokogiri"

basedir = "#{File.dirname(__FILE__)}/.."

logger = Logger.new(STDOUT)

records = []

outdir =basedir + '/tmp/cicorecords'

FileUtils.mkdir_p outdir

Dir["#{basedir}/tmp/resources/*.xml"].each do |file|
  record = Nokogiri::XML(File.read(file))

  ids = record.xpath('//dc:identifier')

  has_ids = ids.any? {|id| ['cico', 'dcl'].include? id.text.split(':').first }

  has_manifest = record.xpath('//dcterms:hasFormat').text.split('/').last == 'manifest'

  collections = record.xpath('//dcterms:isPartOf')
  in_collection = collections.any?{ |c| c.text == "Cicognara Collection"}

  # puts "incollection: |#{collections}|" if in_collection
  FileUtils.cp file, outdir if has_ids and in_collection
end
