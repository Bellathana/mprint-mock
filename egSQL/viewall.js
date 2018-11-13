var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "lionmysql",
  database: "mydb"
});

con.connect(function(err) {
  if (err) throw err;
  //Select all records and return the result object:
  con.query("SELECT * FROM paperType", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    //console.log(fields);
  });
});
