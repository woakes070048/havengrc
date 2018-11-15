'use strict';

const fs = require("fs");
const express = require("express");
const unleash = require('unleash-server');

let options = {};

// TODO remove this adminAuthentication disable as soon as keycloak-proxy is in place
options.adminAuthentication = 'none';


function serveFrontend(app) {
    app.use('/', express.static('/frontend'));
}

options.preHook = serveFrontend;

if (process.env.DATABASE_URL_FILE) {
    options.databaseUrl = fs.readFileSync(process.env.DATABASE_URL_FILE);
}

unleash
    .start(options)
    .then(server => {
        console.log(
            `Unleash API started on http://localhost:${server.app.get('port')}`
        );
    });
