const express = require("express");
const app = express();

var numberToBeEdited = 99; // Start Value of 99

app.all('/', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  next();
 });

app.listen(3000, ()=>{
console.log("Server Started on port 3000");
});

app.get("/counter", function(req,res){
res.send(numberToBeEdited +"");
});

app.put("/counter/:val", function(req,res){

var newValue = req.params.val;
numberToBeEdited = newValue;

res.send(numberToBeEdited + "");
});