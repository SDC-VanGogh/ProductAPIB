const express = require('express');
const db = require('../database/index.js');
const router = require('./routes.js');
const compression = require('compression');
const app = express();
const PORT = 3000;

require('newrelic');
const cluster = require('cluster');
const totalCPUs = require('os').cpus().length;

if (cluster.isMaster) {
  console.log(`Number of CPUs is ${totalCPUs}`);
  console.log(`Master ${process.pid} is running`);

  // Fork workers.
  for (let i = 0; i < totalCPUs; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} died`);
    console.log("Let's fork another worker!");
    cluster.fork();
  });

} else {
app.use('/', router);

app.use(express.json());

app.listen(PORT, () => {
  console.log(`Listening from outerspace @ http://localhost:${PORT}`)
});
}

module.exports = app;