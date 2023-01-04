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
        let obj = {}
        for (const prop in rec) {
            if (prop == 'id') {
                obj['id'] = rec['id']
            }
            else {
                obj[prop] = Array.isArray(rec[prop])? rec[prop].join(' ') : rec[prop]
            }
        }
        builder.add(obj)
    });
});

console.log(idx.search("Plantin"));
