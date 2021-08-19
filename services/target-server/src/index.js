const express = require("express");
const fetch = require("node-fetch");
const logger = require("morgan");

const PORT = 80;

const app = express();
app.use(logger("tiny"));

app.use((req, res) => {
  const userId = req.headers["x-user-id"];
  res.send(`You have reached the target server ${userId}`);
});
app.listen(PORT);
