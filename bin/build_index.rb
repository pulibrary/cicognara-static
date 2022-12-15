require "fileutils"
require "json"

# Builds an index document for the Catalogo, to be used
# by lunr to provide search functionality.

objects = []

# Dir["../tmp/getty_data/*.json"].slice(0,10).each do |f|
Dir["../tmp/getty_data/*.json"].each do |f|
  json = JSON.parse(File.open(f).read)
  obj = {}
  obj['id'] = json['@id']
  ["creator", "subject"].each do |field|
    obj[field] = json[field].collect { |x| x['label'] } if json[field]

  ["description", "issued", "identifier", "language", "title", "publisher", "source"].each do |field|
    obj[field] = json[field].collect { |x| x['value'] } if json[field]
  end

  objects.append(obj)
  end
end

FileUtils.mkdir_p "../catalogo"
File.open("../catalogo/index.json", "w") { |f| f.write(objects.to_json) }
