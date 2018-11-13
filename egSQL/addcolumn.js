var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "lionmysql",
  database: "mydb"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  /*Create a table named "customers":*/
  var sql = "ALTER TABLE paperType ADD unit varchar(255);";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("New column created");
  });
});
