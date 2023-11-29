#!/usr/bin/env ruby

require "fileutils"
require "logger"
require 'json'

basedir = "#{File.dirname(__FILE__)}/.."
logger = Logger.new(STDOUT)

indir = basedir + '/tmp/resources'
outdir = basedir + '/tmp/cicorecords'

FileUtils.mkdir_p outdir

Dir[indir + "/*.json"].each do |file|
  puts "looking at file " + file
  record = JSON.parse(File.read(file))

  ids = record['identifier']
  has_ids = ids and ids.any? {|id| ['dclNumber', 'cicognaraNumber'].include? id['@type'] }

  collections = record['isPartOf']
  
  in_collection = collections and collections.any? {|c| c['value'] == 'Cicognara library.'  or c['label'] == "Cicognara Collection" }
  # puts "incollection: |#{collections}|" if in_collection
  FileUtils.cp file, outdir if has_ids and in_collection
end
