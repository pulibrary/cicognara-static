require "fileutils"
require "json"

# Builds an index document for the Catalogo, to be used
# by fuse to provide search functionality.

objects = []

Dir["../tmp/resources/*.json"].each do |f|
  json = JSON.parse(File.open(f).read)
  isPartOf = json['isPartOf']
  if isPartOf and isPartOf.find {|i| i['@type'] == "virtualCollection" and i['label'] == "Cicognara Collection"}
    puts "indexing " + json['@id']
    obj = {}
    obj['id'] = json['@id']

    # collect only the cicognaraNumber and the dclNumber
    ['cicognaraNumber', 'dclNumber'].each do |idtype|
      id = json['identifier'].find {|i| i['@type'] == idtype}
      obj[idtype] = id['value'] if id
    end


    ["creator", "subject"].each do |field|
      obj[field] = json[field].collect { |x| x['label'] } if json[field]

      ["description", "issued", "language", "title", "publisher"].each do |field|
        obj[field] = json[field].collect { |x| x['value'] } if json[field]
      end

      objects.append(obj)
    end
  end
end

FileUtils.mkdir_p "../catalogo"
File.open("../catalogo/index.json", "w") { |f| f.write(objects.uniq().to_json) }
