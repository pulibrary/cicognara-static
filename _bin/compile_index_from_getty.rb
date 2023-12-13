require 'json'


basedir = "#{File.dirname(__FILE__)}/.."
indir = basedir + '/tmp/resources'

records = []

Dir[indir + "/*.json"].each do |file|
  record = JSON.parse(File.read(file))
  ids = record['identifier']

  if ids and ids.any? {|id| ['dclNumber', 'cicognaraNumber'].include? id['@type'] }

    puts "compiling file " + file
  
    entry = {
      creator: [],
      issued: [],
      description: [],
      extent: [],
      hasFormat: [],
      language: [],
      isReferencedBy: [],
      subject: [],
      title: [],
      publisher: [],
      source: [],
      isPartOf: [],
      grpContributor: [],
      ids: [],
      collections: [],
      date: [],
      contributor: [],
    }

    entry[:ciconum] = ids.select {|id| id['@type'] == 'cicognaraNumber' }.map {|i| i['value']}
    entry[:dclnum] = ids.select {|id| id['@type'] == 'dclNumber' }.map {|i| i['value']}    
    entry[:creator] = record['creator'].collect { |x| x['label'] } if record['creator']
    entry[:issued] = record['issued'].collect { |x| x['value'] } if record['issued']
    entry[:description] = record['description'].collect { |x| x['value'] } if record['description']
    entry[:extent] = record['extent'].collect { |x| x['value'] } if record['extent']
    entry[:language] = record['language'].collect { |x| x['value'] } if record['language']
    entry[:isReferencedBy] = record['isReferencedBy'].collect { |x| x['value'] } if record['isReferencedBy']
    entry[:subject] = record['subject'].collect { |x| x['label'] } if record['subject']
    entry[:title] = record['title'].collect { |x| x['value'] } if record['title']      
    entry[:publisher] = record['publisher'].collect { |x| x['value'] } if record['publisher']      
    entry[:source] = record['source'].collect { |x| x['value'] } if record['source']
    entry[:isPartOf] = record['isPartOf'].collect { |x| x['label'] } if record['isPartOf']
    entry[:date] = record['date'].collect { |x| x['value'] } if record['date']                     
    entry[:contributor] = record['contributor'].collect { |x| x['label'] } if record['contributor']
    records << entry
  end
end
  
File.open(basedir + "/tmp/cicoindex.json", "w") do |f|
  f.write(records.to_json)
end
