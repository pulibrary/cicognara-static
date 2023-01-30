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

  copyit = false

  ids = record.xpath('//dc:identifier')

  has_ids = ids.any? {|id| ['cico', 'dcl'].include? id.text.split(':').first }

  has_manifest = record.xpath('//dcterms:hasFormat').text.split('/').last == 'manifest'

  FileUtils.cp file, outdir if has_ids or has_manifest
end
