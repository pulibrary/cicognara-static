const lunr = require('lunr'),
      fs = require('fs')

fs.readFile('./lunr_idx.json',
            {
                encoding: 'utf-8',
            },
            (err,data) => {
                const idx = lunr.Index.load(JSON.parse(data));
                console.log(idx.search("Plantin"));
            });
