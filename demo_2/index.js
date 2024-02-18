const express = require("express");
const app = express();

app.get("/", function (req, res) {
  res.send("salam duniya 123456");
});

app.listen("8000", function () {
  console.log("http://localhost:8000");
});
