"use strict";

// Basic express setup:

const express = require("express");
const app = express();
const PORT = 8080;
const bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

const homePage = require("./routes/index");
const aboutPage = require("./routes/about");

app.use("/", homePage);
app.use("/about", aboutPage);


app.listen(PORT, function() {
  console.log(`server running on PORT ${PORT}`);
});