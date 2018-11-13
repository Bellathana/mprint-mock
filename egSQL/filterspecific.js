var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "lionmysql",
  database: "mydb"
});

con.connect(function(err) {
  if (err) throw err;
  var sizew = '31';
  //Escape the address value:
  var sql = 'SELECT * FROM paperType WHERE w = ?';
  //Send an array with value(s) to replace the escaped values:
  con.query(sql, [sizew], function (err, result) {
    if (err) throw err;
    console.log(result);
  });
});