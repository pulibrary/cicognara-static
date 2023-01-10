

fetch('https://raw.githubusercontent.com/pulibrary/cicognara-static/fuse/catalogo/index.json?token=GHSAT0AAAAAABWSJ2KUY3UMFIDO74ROTI66Y5XNETQ', {
    headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin':'*'
    }
})
    .then((response) => response.json())
    .then((json) => console.log(json));


