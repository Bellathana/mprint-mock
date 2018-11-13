var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "lionmysql",
  database: "mydb"
});

/* con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  //Insert a record in the "customers" table:
  var sql = "INSERT INTO paperType (name, w, h, gram, unit) VALUES ('Sticker white', '24', '35', '200', 'inch')";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
}); */

var express = require("express");
var app     = express();
var path    = require("path");
var mysql = require('mysql');
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/',function(req,res,next){
res.sendFile(path.join(__dirname+'/view-html/paper/addPaperPrototype.html'));
});

app.post('/addsupplier',function(req,res){
    var supname = req.body.supname;
    var contactname = req.body.contactname;
    var telephoneno1 = req.body.telephoneno1;
    var telephoneno2 = req.body.telephoneno2;
    var faxno = req.body.faxno;
    var email = req.body.email;
    var address = req.body.address;
    var other = req.body.other;
    var suptype = req.body.suptype;
    var isactive = req.body.isactive;
    
if (req.method === 'POST') { //body phraser
    let body = '';
    req.on('data', chunk => {
        body += chunk.toString(); // convert Buffer to string
    });
    req.on('end', () => {
        console.log(body);
        res.end('ok');
    });
}
    
    res.write('Supplier name "' + req.body.name+'".\n');
    res.write('You sent the width "' + req.body.w+'".\n');
    res.write('You sent the higth "' + req.body.h+'".\n');
    res.write('You sent the gram "' + req.body.gram+'".\n');
    res.write('You sent the unit "' + req.body.unit+'".\n');

  con.connect(function(err) {
  console.log('Connecting database..');
      if (err) throw err
      console.log('Connecting error');;
      
      var sql = "INSERT INTO supplier (name, w , h, gram, unit) VALUES ('"+name+"', '"+w+"','"+h+"', '"+gram+"', '"+unit+"')";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
     res.end();
  });
  });
})
app.listen(8080);
console.log("Running at Port 8080");