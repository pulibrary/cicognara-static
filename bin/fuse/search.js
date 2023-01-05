const Fuse = require('fuse.js');
const data = require('../../catalogo/index.json');

const options = { includeScore: true,
                  threshold: 0.1,
                  keys: ["creator"]
                };

const fuse = new Fuse(data, options)
const results = fuse.search({creator: 'Lipsius'})
console.log(results)
