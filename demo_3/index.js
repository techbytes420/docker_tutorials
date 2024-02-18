const express = require("express");
const app = express();
const mongoose = require("mongoose");

const connectDB = async () => {
  try {
    await mongoose.connect(
      "mongodb://root:1234@mongodb:27017?authSource=admin",
      { serverSelectionTimeoutMS: 1000 }
    );
    console.log("mongodb connected");
  } catch (error) {
    console.log("Error connecting mongodb", error);
  }
};

connectDB();

app.get("/", function (req, res) {
  res.send("salam duniya 123456");
});

app.listen("8000", function () {
  console.log("http://localhost:8000");
});
