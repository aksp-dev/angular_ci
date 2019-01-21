const express = require('express');
const path = require('path');
const http = require('http');
const app = express();

const port = '3000';
app.set('port', port);

/**
 * HTTPサーバの作成
 */
console.log(__dirname)
app.use(express.static(__dirname + '/../dist/angular-citest/'));
const server = http.createServer(app);
server.listen(port, () => console.log(`Server is running on localhost:${port}`));