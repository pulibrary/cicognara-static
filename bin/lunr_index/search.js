const lunr = require('lunr'),
      stdout = process.stdout;

let data = require('../../catalogo/index.json');

let idx = lunr(function(builder) {
    builder.ref('id');
    builder.field("creator", { boost: 3});
    builder.field("subject", { boost: 3 });
    builder.field("description", { boost: 3});
    builder.field("issued");
    builder.field("identifier");
    builder.field("language");
    builder.field("title", { boost: 3});
    builder.field("publisher");
    builder.field("source");

    //    data.forEach(record => builder.add(record));
    data.forEach(function (rec) {
        builder.add(
            {
                'id': rec['id'],
                'creator': Array.isArray(rec['creator'])? rec['creator'].join(' ') : rec['creator'],
                'subject': Array.isArray(rec['subject'])? rec['subject'].join(' ') : rec['subject'],
                'description': Array.isArray(rec['description'])? rec['description'].join(' ') : rec['description'],
                'issued': Array.isArray(rec['issued'])? rec['issued'].join(' ') : rec['issued'],
                'identifier': Array.isArray(rec['identifier'])? rec['identifier'].join(' ') : rec['identifier'],
                'language': Array.isArray(rec['language'])? rec['language'].join(' ') : rec['language'],
                'title': Array.isArray(rec['title'])? rec['title'].join(' ') : rec['title'],
                'publisher': Array.isArray(rec['publisher'])? rec['publisher'].join(' ') : rec['publisher'],
                'source': Array.isArray(rec['source'])? rec['source'].join(' ') : rec['source'],
            }
        )
    })
});

//console.log(idx)
//idx.search("Pozzuoli"));
console.log(idx.search("Plantin"));
