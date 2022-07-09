import mysql from "mysql2";

// create the connection to database
const db = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "Happyfamily604!",
  database: "assignment3_396",
});

export default db;
