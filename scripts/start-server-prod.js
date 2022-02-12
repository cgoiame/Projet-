#!/usr/bin/env node

process.env.PORT = 5000;
process.env.NODE_ENV = 'production';
const server = require('./start-server-dev');
server();
