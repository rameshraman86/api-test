"use strict";

const express = require('express');
const app = express.Router();


app.get('/', function(req, res) {
  res.send("Hello World!!!");
});


module.exports = app;