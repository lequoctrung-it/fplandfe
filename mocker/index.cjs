const delay = require('mocker-api/delay');

const config = {
    _proxy: {
        watchOptions: {
            usePolling: true // this is for watch changes inside docker container
        },
    },
}

const helloAPI = {
    'GET /api/hello': (req, res) => {
        return res.json({
            name: "Thuy"
        });
    },
}

const proxy = {
    ...config,
    ...helloAPI,
}

module.exports = (delay(proxy, 1000));