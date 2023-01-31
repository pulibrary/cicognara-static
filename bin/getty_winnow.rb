#!/usr/bin/env ruby

require "fileutils"
require "logger"
require "nokogiri"

def is_cico(node)
  tokens = node.text.gsub(' ', '').split(';')
  return false unless tokens.any? { |tok| tok =~/^cico:/}
  ids = tokens.collect { |tok| tok.split(':').last }
  return ids.all? { |i| i =~ /^\d/ }
end

basedir = "#{File.dirname(__FILE__)}/.."
logger = Logger.new(STDOUT)
records = []
outdir =basedir + '/tmp/cicorecords'

FileUtils.mkdir_p outdir

Dir["#{basedir}/tmp/resources/*.xml"].each do |file|
  record = Nokogiri::XML(File.read(file))

  ids = record.xpath('//dc:identifier')
  has_cico = ids.any? { |id| is_cico(id) }

  collections = record.xpath('//dcterms:isPartOf')
  in_collection = collections.any?{ |c| c.text == "Cicognara Collection"}

  hasFormat = record.xpath('//dcterms:hasFormat')

  has_manifest = hasFormat.length > 0

  FileUtils.cp file, outdir if has_cico and in_collection and has_manifest
end
