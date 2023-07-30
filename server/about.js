const express = require('express');
const app = express.Router();


app.get('/about', (req, res) => {
  res.send('This is the about page!!!');
});

module.exports = app;