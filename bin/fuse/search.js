// search.js  Quick demo of fuse.js

const Fuse = require('fuse.js');
const data = require('../../catalogo/index.json');

const options = { includeScore: true,
                  threshold: 0.1,
                  keys: ["creator"]
                };

const fuse = new Fuse(data, options)
const results = fuse.search({creator: 'Lipsius'})
results.forEach(result =>{
    console.log(result.item.creator)
})
