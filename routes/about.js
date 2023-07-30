"use strict";

const express = require('express');
const app = express.Router();


app.get('/', (req, res) => {
  res.send('This is the about page!!!');
});

module.exports = app;