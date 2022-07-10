// import connection
import db from "../config/database.js";

// Get All Products
export const getProducts = (result) => {
  db.query("SELECT * FROM z_parts204", (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};
//insert purchase order
export const insertPo = (data, result) => {
  db.query("INSERT INTO z_pos204 SET ?", [data], (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};
//insert line
export const insertLine = (data, result) => {
  db.query("INSERT INTO z_line204 SET ?", [data], (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};
//List Purchase order
export const listPos = (result) => {
  db.query("SELECT * FROM z_pos204", (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};
// List Line order
// export const listLines = (result) => {
//     db.query("SELECT * FROM line204 ", (err, results) => {
//         if(err) {
//             console.log(err);
//             result(err, null);
//         } else {
//             result(null, results);
//         }
//     });
// }

export const getTheLines = (data, result) => {
  db.query(
    `SELECT * FROM z_line204 WHERE Z_LineNo204 = ${data.Z_LineNo204}`,
    (err, results) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        result(null, results[0]);
      }
    }
  );
};

export const getThePos = (data, result) => {
  db.query(
    "SELECT * FROM z_pos204 WHERE ZPOs_ClientCompID = ?",
    [data],
    (err, results) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        result(null, results[0]);
      }
    }
  );
};
